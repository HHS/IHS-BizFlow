<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.RollingFileAppender" %>
<%@ page import="org.apache.log4j.PatternLayout" %>
<%@ page import="org.apache.log4j.Level" %>
<%@ page import="org.apache.commons.httpclient.*" %>
<%@ page import="org.apache.commons.httpclient.methods.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.hs.bf.web.xmlrs.XMLResultSet" %>
<%@ page import="com.hs.bf.web.xmlrs.XMLResultSetImpl" %>
<%@ page import="com.hs.bf.web.beans.HWSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hs.bf.web.beans.HWSessionInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hs.bf.web.beans.HWFilter" %>
<%@ page import="com.hs.frmwk.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/bizflow.tld" prefix="bf" %>
<jsp:useBean id="hwSessionInfo" class="com.hs.bf.web.beans.HWSessionInfo" scope="session" />
<jsp:useBean id="hwSessionFactory" class="com.hs.bf.web.beans.HWSessionFactory" scope="application"/>
<bf:parameter id="processid" name="processid" value="" valuePattern="NoRiskyValue"/>
<bf:parameter id="activityid" name="activityid" value="" valuePattern="NoRiskyValue"/>
<bf:parameter id="workitemseq" name="workitemseq" value="" valuePattern="NoRiskyValue"/>
<bf:parameter id="documenttype" name="documenttype" value="IHS Recruitment Worksheet" />
<bf:parameter id="filename" name="filename" value="IHS Recruitment Worksheet.pdf" />
<%!
	static final String DEFAULT_DOCUMENT_TYPE = "IHS Recruitment Worksheet";
	static final String DEFAULT_FILE_NAME = "IHS Recruitment Worksheet.pdf";
	static final String PROCESS_DEFINITION_NAME = "Fill a Vacancy";
	static final String RUNNING_PROCESS_STATE = "R";

	static final String REPORT_URL = "http://localhost/bizflowadvreport/rest_v2/reports/reports/IHS/IHS_RECRUITMENT_WKSHEET.pdf?j_memberid={J_MEMBERID}&j_username={J_USERNAME}&Tracking_Number={TRACKING_NUMBER}";

	static Logger log = null;
 
	File downloadWorksheet(String jMemberId, String jUserName, int trackingNumber) {
		File fp = null;
		final HttpClient client = new HttpClient();
		try{
			String url = REPORT_URL;
			url = StringUtils.replace(url, "{J_MEMBERID}", jMemberId);
			url = StringUtils.replace(url, "{J_USERNAME}", jUserName);
			url = StringUtils.replace(url, "{TRACKING_NUMBER}", String.valueOf(trackingNumber));

			log.debug(url);
			GetMethod getMethod = new GetMethod(url);
			int statusCode = client.executeMethod(getMethod);
			if (statusCode == HttpStatus.SC_OK) {
				InputStream inputStream = getMethod.getResponseBodyAsStream();
				fp = File.createTempFile("ihs_", ".pdf");

				try
				{
					FileOutputStream fos = new FileOutputStream(fp);
					byte[] buffer = new byte[1024];
					int len = 0;
					while ((len = inputStream.read(buffer)) != -1) {
						  fos.write(buffer, 0, len);
					}
					inputStream.close();
					fos.close();
				}
				catch (IOException e)
				{
					log.error("Error during the downloading the Worksheet report file.", e);
					fp = null;
				}
			}
			
			getMethod.releaseConnection();
		}catch(HttpException he){
			log.error(he);
		}catch(IOException ioe){
			log.error(ioe);
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
	try {
		String init = (String) application.getAttribute("pdfgenerator.init");
		if (!"true".equals(init)) 
		{
			String filePath = "./logs/pdfgenerator.log";
			PatternLayout layout = new PatternLayout("%-5p %d %m%n");
			RollingFileAppender appender = new RollingFileAppender(layout, filePath);
			appender.setName("pdfgenerator");
			appender.setMaxFileSize("1MB");
			appender.setMaxBackupIndex(10);
			appender.activateOptions();
			Logger.getLogger("pdfgenerator").setLevel(Level.DEBUG);
			Logger.getRootLogger().addAppender(appender);
			application.setAttribute("pdfgenerator.init", "true");
		}

		log = Logger.getLogger("pdfgenerator");
		
	} catch (IOException e) {
		e.printStackTrace();
	}

	JSONObject ret = new JSONObject();
	HWSession hwSession = hwSessionFactory.newInstance();
	XMLResultSet loginUser = null;
	int nProcessId = -1;
	int nWorkitemSeq = -1;
	int nActivityId = -1;
	boolean success = true;

	try {
		// Validation
		loginUser = (XMLResultSet) session.getAttribute("LoginUser");
		nProcessId = Integer.parseInt(processid);
		nWorkitemSeq = Integer.parseInt(workitemseq);
		nActivityId = Integer.parseInt(activityid);
		if(StringUtils.isEmpty(documenttype)){
			documenttype = DEFAULT_DOCUMENT_TYPE;
		}
		if(StringUtils.isEmpty(filename)){
			filename = DEFAULT_FILE_NAME;
		}

		XMLResultSet xrsProcess = getProcess(hwSession, hwSessionInfo, nProcessId);
		int cnt = xrsProcess.getRowCount();
		if(cnt == 0
			|| !PROCESS_DEFINITION_NAME.equals(xrsProcess.getFieldValueAt(0, "PROCESSDEFINITIONNAME"))
			|| !RUNNING_PROCESS_STATE.equals(xrsProcess.getFieldValueAt(0, "STATE"))){
			success = false;
			errorMsg = "Invalid Request.";
		}

		if(success) {
			XMLResultSet xrs = getAttachments(hwSession, hwSessionInfo, nProcessId);
			for (int i = 0; i < xrs.getRowCount(); i++) {
				if (documenttype.equalsIgnoreCase(xrs.getFieldValueAt(i, "CATEGORY"))) {
					errorMsg = "Requested document type (" + documenttype + ") has already been attached.";
					success = false;
					break;
				}
			}
		}
	}catch(Exception e) {
		log.trace(e);
		errorMsg = "Invalid parameters.";
		success = false;
	}

	if(success) {
		try {
			// download Worksheet report file
			String jMemberID = loginUser.getFieldValueAt(0, "ID");
			String jUserName = loginUser.getFieldValueAt(0, "LOGINID");
			File worksheetFile = downloadWorksheet(jMemberID, jUserName, nProcessId);
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
				xrs.setFieldValueAt(r, "CATEGORY", documenttype);
				xrs.setFieldValueAt(r, "DISPLAYNAME", filename);
				xrs.setFieldValueAt(r, "FILENAME", filename);
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
			log.trace(e);
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
		ret.put("fileName", filename);
	}
	out.clear();
	response.setContentType("application/json; charset=UTF-8");
	out.write(ret.toString());
%>