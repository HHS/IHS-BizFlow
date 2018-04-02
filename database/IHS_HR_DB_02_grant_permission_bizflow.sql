

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
