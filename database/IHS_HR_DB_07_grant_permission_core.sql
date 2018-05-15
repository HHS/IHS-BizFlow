--=============================================================================
-- Grant privileges on objects under CMS schema to roles
-------------------------------------------------------------------------------


-- privilege for HHS_IHS_HR_RW_ROLE;

GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.ERROR_LOG TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.FORM_DTL TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.FORM_DTL_AUDIT TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.LOOKUP TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT ON HHS_IHS_HR.DUTYLOCATION TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT ON HHS_IHS_HR.ADMINCODE TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT ON HHS_IHS_HR.OCCUPATIONALSERIES TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT ON HHS_IHS_HR.GRADE TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.ATTACH_AUDIT TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.SEND_EMAIL TO HHS_IHS_HR_RW_ROLE;
GRANT SELECT, INSERT, UPDATE, DELETE ON HHS_IHS_HR.IHS_RECRUITEMENT_DATA TO HHS_IHS_HR_RW_ROLE;

GRANT EXECUTE ON HHS_IHS_HR.SP_ERROR_LOG TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_UPDATE_FORM_DATA TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_UPDATE_PV_FROM_FORMDATA TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_UPDATE_PV_FROM_FORMDATA_SC TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_SEND_EMAIL TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_ATTACH_AUDIT TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_UPDATE_CLASSIFIER TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_UPDATE_REPORT_FROM_FORMDATA TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_STOP_MANAGER_REMINDER TO HHS_IHS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_IHS_HR.SP_MONITOR_USAS TO HHS_IHS_HR_RW_ROLE;

-- required to execute stored procedure SP_MONITOR_USAS
GRANT EXECUTE ON HHS_IHS_HR.SP_MONITOR_USAS TO BIZFLOW;
GRANT EXECUTE ON HHS_IHS_HR.FN_COPY_FORM_DTL TO BIZFLOW;

