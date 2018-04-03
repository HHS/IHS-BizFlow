--------------------------------------------------------
--  File created - Thursday-April-27-2017
--------------------------------------------------------
REM INSERTING into HHS_IHS_HR.LOOKUP
SET DEFINE OFF;

-- ActionType
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ActionType','Fill a Vacancy','Fill a Vacancy','1','N');

-- CancellationReason
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Administrative error','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Duplicate recruitment','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Hiring Freeze','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Incumbent requested to remain in the position after giving notice','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Lack of funding','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Per management request','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Position abolished','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Reduction in Force (RIF)','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Cancelled, Non-competitive Assignment','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'CancellationReason','Emergency Hire','','1','N');
update lookup set tbl_label = tbl_name where tbl_ltype='CancellationReason';

-- DocumentType
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','Job Analysis','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','Position Descriptions (PD)','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','Selective Placement Factors (SPF)','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','OF8','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','IHS Recruitment Worksheet','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','EHRP Request','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','FLSA Determination Worksheet, dated 11/2015','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','Supervisory Position Risk Determination','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','Position Sensitivity Form','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'DocumentType','Other','','1','N');
update lookup set tbl_label = tbl_name where tbl_ltype='DocumentType';

-- ClassificationStatus
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Class Review Needed','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending OF8 Update','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending Classification','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending Desk Audit','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending Redescription','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending Documents from Mgmt','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Returned to Mgmt for Signature','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Cancelled','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending Security','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Pending Position Designation','','1','N');
--Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'ClassificationStatus','Classification Complete','','1','N');
update lookup set tbl_label = tbl_name where tbl_ltype='ClassificationStatus';

-- Pay Plan
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'PayPlan','GS','GS','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'PayPlan','GP','GP','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'PayPlan','GR','GR','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'PayPlan','WG','WG','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'PayPlan','WL','WL','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'PayPlan','WS','WS','1','N');

-- Appointment Type
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Permanent','Permanent','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Temporary','Temporary','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Temporary Promotion','Temporary Promotion','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Intermittent','Intermittent','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Term','Term','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Pathways Student','Pathways Student','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Seasonal','Seasonal','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Summer','Summer','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Telework','Telework','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Internships','Internships','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Detail','Detail','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','ICTAP Only','ICTAP Only','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Presidential Management Fellows','Presidential Management Fellows','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AppointmentType','Recent Graduates','Recent Graduates','1','N');

-- Hiring Plan
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'HiringPlan','MP/ESEP Hiring Plan','MP/ESEP Hiring Plan','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'HiringPlan','ESEP Hiring Plan Only','ESEP Hiring Plan Only','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'HiringPlan','All Sources: DE, MP, ESEP (two separate announcements required)','All Sources: DE, MP, ESEP (two separate announcements required)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'HiringPlan','All Sources: DH, MP, ESEP (two separate announcements required)','All Sources: DH, MP, ESEP (two separate announcements required)','1','N');

-- Additional Hiring Plan
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalHiringPlan','Gov-wide','Gov-wide','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalHiringPlan','HHS-wide','HHS-wide','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalHiringPlan','IHS-wide','IHS-wide','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalHiringPlan','Area-wide','Area-wide','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalHiringPlan','Local Commuting Area (Mgmt. documentation required)','Local Commuting Area (Mgmt. documentation required)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalHiringPlan','Program-wide (Mgmt. documentation required)','Program-wide (Mgmt. documentation required)','1','N');

-- Announcement Close Mode
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AnnouncementCloseMode','Open Continuous','Open Continuous','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AnnouncementCloseMode','Open Until Filled','Open Until Filled','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AnnouncementCloseMode','Time Limited','Time Limited','1','N');

-- Work Schedule
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'WorkSchedule','Full Time','Full Time','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'WorkSchedule','Part-time','Part-time','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'WorkSchedule','Intermittent','Intermittent','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'WorkSchedule','Job Sharing','Job Sharing','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'WorkSchedule','Shift Work','Shift Work','1','N');

-- Recruitment Enticement
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Annual Leave Credit for Non-Federal Service ("New Feds")','Annual Leave Credit for Non-Federal Service ("new" Feds)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Setting Pay at an Advanced Rate based on Superior Qualifications & Special Needs ("new" Feds)','Setting Pay at an Advanced Rate based on Superior Qualifications & Special Needs ("new" Feds)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Relocation Expenses Paid (decision before JOA)','Relocation Expenses Paid (decision before JOA)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Recruitment Incentives ("new" Feds)','Recruitment Incentives ("new" Feds)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Relocation Incentives (current Feds only)','Relocation Incentives (current Feds only)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','IHS Loan Repayment Program','IHS Loan Repayment Program','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Housing Available','Housing Available','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'RecruitmentEnticement','Telework or Remote Work','Telework or Remote Work','1','N');

-- Overnight Travel
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'OvernightTravel','Not required','Not required','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'OvernightTravel','Occasional travel','Occasional travel','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'OvernightTravel','25% or less','25% or less','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'OvernightTravel','50% or less','50% or less','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'OvernightTravel','75% or less','75% or less','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'OvernightTravel','76% or greater','76% or greater','1','N');
UPDATE lookup SET tbl_disp_order = -1 WHERE tbl_ltype='OvernightTravel' AND tbl_name = 'Not required';

-- Additional Recruitment
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','School/University Posting','School/University Posting','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','Social Media','Social Media','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','Commissioned Corps Listserv','Commissioned Corps Listserv','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','The Diversity Outreach Resource (DOR)','The Diversity Outreach Resource (DOR)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','Advertising on/at','Advertising on/at','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','All tribes newsletter (terrab@tribalselfgov.org)','All tribes newsletter (terrab@tribalselfgov.org)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','National Congress of American Indians (support @ncai.org)','National Congress of American Indians (support @ncai.org)','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'AdditionalRecruitment','Other','Other','1','N');
UPDATE lookup SET tbl_disp_order = 1 WHERE tbl_ltype='AdditionalRecruitment' AND tbl_name != 'Other';
UPDATE lookup SET tbl_disp_order = 99 WHERE tbl_ltype='AdditionalRecruitment' AND tbl_name = 'Other';

-- Security Clearance
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','ANACI Access NACI','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','BI Background Investigation','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','CNACI-background Investigation','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Confidential','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','L (Atomic Energy Act)','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','MBI Minimum BI','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','NACI','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','NACIS - (NACI and Credit)','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Not Required','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Other','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','PTL V-LTD','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','BD Investigation','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Q Non-Sensitive','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Q Sensitive','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','SSBI Single Scope BI','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Secret','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Sensitive Compartmented Info','','1','N');
Insert into LOOKUP (TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_MANDATORY) values (0,'SecurityClearance','Top Secret','','1','N');
update lookup set tbl_label = tbl_name where tbl_ltype='SecurityClearance';


UPDATE lookup SET TBL_EFFECTIVE_DT = TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TBL_EXPIRATION_DT = TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') WHERE TBL_EFFECTIVE_DT IS NULL;
COMMIT;