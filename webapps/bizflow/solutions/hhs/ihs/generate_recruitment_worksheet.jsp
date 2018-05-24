<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.hs.bf.web.xmlrs.XMLResultSet" %>
<%@ page import="com.hs.bf.web.xmlrs.XMLResultSetImpl" %>
<%@ page import="com.hs.bf.web.beans.HWSession" %>
<%@ page import="com.hs.bf.web.beans.HWSessionInfo" %>
<%@ page import="com.hs.bf.web.beans.HWFilter" %>
<%@ page import="com.hs.frmwk.json.JSONObject" %>
<%@ page import="com.hs.ja.web.servlet.ServletUtil" %>
<%@ page import="java.util.Properties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/bizflow.tld" prefix="bf" %>
<jsp:useBean id="bizflowProps" class="com.hs.bf.web.props.Properties" scope="application"/>
<jsp:useBean id="hwSessionFactory" class="com.hs.bf.web.beans.HWSessionFactory" scope="application"/>
<jsp:useBean id="hwSessionInfo" class="com.hs.bf.web.beans.HWSessionInfo" scope="session"/>
<jsp:useBean id="hwiniSystem" class="com.hs.frmwk.common.ini.IniFile" scope="application"/>
<bf:parameter id="processid" name="processid" value="" valuePattern="NoRiskyValue"/><%--madatory--%>
<bf:parameter id="activityid" name="activityid" value="" valuePattern="NoRiskyValue"/><%--madatory--%>
<bf:parameter id="workitemseq" name="workitemseq" value="" valuePattern="NoRiskyValue"/><%--madatory--%>
<%@ include file="./sslinit.jsp" %>
<%!
	static final String DEFAULT_DOCUMENT_TYPE = "IHS Recruitment Worksheet";
	static final String DEFAULT_FILE_NAME = "IHS Recruitment Worksheet.pdf";
	static final String PROCESS_DEFINITION_NAME = "Fill a Vacancy";
	static final String RUNNING_PROCESS_STATE = "R";
	static Properties IHSProperties = null;

	static final String REPORT_URL = "{REPORTSERVERURL}/rest_v2/reports{PATH}.{FILEFORMAT}?j_memberid={J_MEMBERID}&j_username={J_USERNAME}&Tracking_Number={TRACKING_NUMBER}";

	static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger("JSP");

	void loadProperties(ServletContext application){
		try
		{
			if (null == IHSProperties)
			{
				IHSProperties = new Properties();
				IHSProperties.load(new FileInputStream(ServletUtil.getRealPath(application, "/solutions/hhs/ihs/ihs.properties")));
			}
		}
		catch (Exception e)
		{
		}
	}

	File downloadWorksheet(HttpServletRequest request, String reportServerURL, String path, String fileFormat, String jMemberId, String jUserName, int trackingNumber) {
		File fp = null;
		try{
			initSSLEx(request, reportServerURL);

			String url = REPORT_URL;
			url = StringUtils.replace(url, "{REPORTSERVERURL}", reportServerURL);
			url = StringUtils.replace(url, "{PATH}", path);
			url = StringUtils.replace(url, "{FILEFORMAT}", fileFormat);
			url = StringUtils.replace(url, "{J_MEMBERID}", jMemberId);
			url = StringUtils.replace(url, "{J_USERNAME}", jUserName);
			url = StringUtils.replace(url, "{TRACKING_NUMBER}", String.valueOf(trackingNumber));

			java.net.URL agent = new java.net.URL(url);

			InputStream inputStream = null;
			FileOutputStream fos = null;
			fp = File.createTempFile("ihs_", ".pdf");

			try
			{
				inputStream = new BufferedInputStream(agent.openStream());
				fos = new FileOutputStream(fp);
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = inputStream.read(buffer)) != -1) {
					fos.write(buffer, 0, len);
				}
			}
			catch (IOException e)
			{
				log.error("Error during the downloading the Worksheet report file. (url=" + url +")", e);
				fp = null;
			}
			finally
			{
				if (inputStream != null) try { inputStream.close(); } catch (Exception be) {};
				if (fos != null) try { fos.close(); } catch (Exception we) {};
			}
		}catch(Exception e){
			log.error(e);
		}

		return fp;
	}
	XMLResultSet getAttachments(HWSession hwSession, HWSessionInfo hwSessionInfo, int processId) throws Exception {
		HWFilter filter = new HWFilter();
		filter.setName("HWATTACHMENT");
		filter.addFilter("SERVERID", "E", hwSessionInfo.getServerID());
		filter.addFilter("PROCESSID", "E", Integer.toString(processId));

		XMLResultSet xrs = new XMLResultSetImpl();
		xrs.setLookupField("ID");
		xrs.parse(hwSession.getAttachments(hwSessionInfo.toString(), filter.toByteArray()));
		return xrs;
	}

	XMLResultSet getProcess(HWSession hwSession, HWSessionInfo hwSessionInfo, int processId) throws Exception {
		HWFilter filter = new HWFilter();
		filter.setName("HWProcess");
		filter.addFilter("ServerID", "E", hwSessionInfo.getServerID());
		filter.addFilter("ID", "E", Integer.toString(processId));
		XMLResultSet xrs = new XMLResultSetImpl();
		xrs.parse(hwSession.getProcesses(hwSessionInfo.toString(), filter.toByteArray()));
		return xrs;
	}
%>
<%
	String errorMsg = null;
	JSONObject ret = new JSONObject();
	HWSession hwSession = hwSessionFactory.newInstance();
	XMLResultSet loginUser = null;
	int nProcessId = -1;
	int nWorkitemSeq = -1;
	int nActivityId = -1;
	boolean success = true;
	String documentType = null;
	String fileName = null;
	String validProcessDefinitionName = null;
	String reportPath = null;
	String fileFormat = "pdf";
	String reportServerURL = null;

	try {
		loadProperties(application);

		// Validation
		loginUser = (XMLResultSet) session.getAttribute("LoginUser");
		nProcessId = Integer.parseInt(processid);
		nWorkitemSeq = Integer.parseInt(workitemseq);
		nActivityId = Integer.parseInt(activityid);
		validProcessDefinitionName = IHSProperties.getProperty("report.IHSRecruitmentWorksheet.processName",PROCESS_DEFINITION_NAME);
		reportServerURL = IHSProperties.getProperty("report.server.url", "https://localhost/bizflowadvreport");
		documentType = IHSProperties.getProperty("report.IHSRecruitmentWorksheet.documentType",DEFAULT_DOCUMENT_TYPE);
		fileName = IHSProperties.getProperty("report.IHSRecruitmentWorksheet.fileName",DEFAULT_FILE_NAME);
		reportPath = IHSProperties.getProperty("report.IHSRecruitmentWorksheet.path");

		XMLResultSet xrsProcess = getProcess(hwSession, hwSessionInfo, nProcessId);
		int cnt = xrsProcess.getRowCount();
		if(cnt == 0
			|| !validProcessDefinitionName.equals(xrsProcess.getFieldValueAt(0, "PROCESSDEFINITIONNAME"))
			|| !RUNNING_PROCESS_STATE.equals(xrsProcess.getFieldValueAt(0, "STATE"))){
			success = false;
			errorMsg = "Invalid Request.";
		}

		if(success) {
			XMLResultSet xrs = getAttachments(hwSession, hwSessionInfo, nProcessId);
			for (int i = 0; i < xrs.getRowCount(); i++) {
				if (documentType.equalsIgnoreCase(xrs.getFieldValueAt(i, "CATEGORY"))) {
					errorMsg = "Requested document type (" + documentType + ") has already been attached.";
					success = false;
					break;
				}
			}
		}
	}catch(Exception e) {
		log.error(e);
		errorMsg = "Invalid parameters.";
		success = false;
	}

	if(success) {
		try {
			// download Worksheet report file
			String jMemberID = loginUser.getFieldValueAt(0, "ID");
			String jUserName = loginUser.getFieldValueAt(0, "LOGINID");
			File worksheetFile = downloadWorksheet(request, reportServerURL, reportPath, fileFormat, jMemberID, jUserName, nProcessId);
			if (worksheetFile != null && 0<worksheetFile.length()) {
				// Attach to process
				XMLResultSet xrs = new XMLResultSetImpl();
				xrs.createResultSet("HWAttachments", "HWATTACHMENT");
				int r = xrs.add();
				xrs.setFieldValueAt(r, "SERVERID", hwSessionInfo.getServerID());
				xrs.setFieldValueAt(r, "PROCESSID", processid);
				xrs.setFieldValueAt(r, "ACTIVITYSEQUENCE", activityid);
				xrs.setFieldValueAt(r, "ID", String.valueOf(r));
				xrs.setFieldValueAt(r, "WORKITEMSEQUENCE", workitemseq);
				xrs.setFieldValueAt(r, "TYPE", "G");
				xrs.setFieldValueAt(r, "OUTTYPE", "B");
				xrs.setFieldValueAt(r, "INTYPE", "C");
				xrs.setFieldValueAt(r, "DIGITALSIGNATURE", "N");
				xrs.setFieldValueAt(r, "MAPID", String.valueOf(r));
				xrs.setFieldValueAt(r, "DMDOCRTYPE", "N");
				xrs.setFieldValueAt(r, "CATEGORY", documentType);
				xrs.setFieldValueAt(r, "DISPLAYNAME", fileName);
				xrs.setFieldValueAt(r, "FILENAME", fileName);
				xrs.setFieldValueAt(r, "SIZE", String.valueOf(worksheetFile.length()));

				String[] attachFiles = {worksheetFile.getPath()};
				hwSession.updateAttachments(hwSessionInfo.toString(),
						hwSessionInfo.getServerID(),
						nProcessId,
						nActivityId,
						xrs.toByteArray(),
						attachFiles);

				worksheetFile.delete();
			} else {
				errorMsg = "[Internal Error] Cannot create an IHS Recruitment Worksheet.";
			}

		} catch (Exception e) {
			errorMsg = "[Internal Error] " + e.getMessage();
			log.error(e);
		}
	}

	if(errorMsg != null)
	{
		ret.put("success", false);
		ret.put("message", errorMsg);
	}
	else
	{
		ret.put("success", true);
		ret.put("fileName", fileName);
	}
	out.clear();
	response.setContentType("application/json; charset=UTF-8");
	out.write(ret.toString());
%>