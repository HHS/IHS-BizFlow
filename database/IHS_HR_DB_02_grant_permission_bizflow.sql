

--=============================================================================
-- Grant privileges on objects under IHS schema to roles
-------------------------------------------------------------------------------


-- privilege on BIZFLOW tables to be used in stored procedure of HHS_IHS_HR schema
-- NOTE: This cannot be granted through role and should be granted individually and directly to user

GRANT SELECT, INSERT, UPDATE ON BIZFLOW.RLVNTDATA TO HHS_IHS_HR;
GRANT SELECT ON BIZFLOW.WITEM TO HHS_IHS_HR;
GRANT SELECT ON BIZFLOW.PROCS TO HHS_IHS_HR;
GRANT SELECT ON BIZFLOW.MEMBER TO HHS_IHS_HR;
GRANT SELECT ON BIZFLOW.ATTACH TO HHS_IHS_HR;
GRANT SELECT, UPDATE ON BIZFLOW.DEADLINE TO HHS_IHS_HR;
GRANT SELECT ON BIZFLOW.PARENTMEMBER TO HHS_IHS_HR;

-- required to generate stored procedure SP_MONITOR_USAS
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_ANNOUNCEMENT TO HHS_IHS_HR WITH GRANT OPTION;
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_CERTIFICATE TO HHS_IHS_HR WITH GRANT OPTION;
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_NEW_HIRE TO HHS_IHS_HR WITH GRANT OPTION;
GRANT SELECT ON HHS_HR.ADMINISTRATIVE_CODE TO HHS_IHS_HR WITH GRANT OPTION;
GRANT SELECT ON HHS_HR.DUTY_STATION TO HHS_IHS_HR WITH GRANT OPTION;

-- required to execute stored procedure SP_MONITOR_USAS
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_ANNOUNCEMENT TO BIZFLOW;
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_CERTIFICATE TO BIZFLOW;
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_NEW_HIRE TO BIZFLOW;
GRANT SELECT ON HHS_HR.DSS_IHS_VAC_ANN_REVIEW TO BIZFLOW;
