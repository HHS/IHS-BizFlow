
--=============================================================================
-- Create TABLESPACE, USER for IHS project to be run by system admin account
-------------------------------------------------------------------------------

-- Make sure the directory to store the datafile actually exists on the server where DBMS is installed.
CREATE TABLESPACE HHS_IHS_HR_TS DATAFILE 'D:\bizflowdb\HHS_IHS_HR_TS.dbf' SIZE 30M AUTOEXTEND ON NEXT 3M MAXSIZE UNLIMITED;





CREATE USER HHS_IHS_HR IDENTIFIED BY HHS_IHS_HR
	DEFAULT TABLESPACE HHS_IHS_HR_TS
	QUOTA UNLIMITED ON HHS_IHS_HR_TS
;


-- create role and grant privilege
CREATE ROLE HHS_IHS_HR_RW_ROLE;
CREATE ROLE BF_DEV_ROLE;

-- grant IHS role to IHS user
GRANT CONNECT, RESOURCE, HHS_IHS_HR_RW_ROLE TO HHS_IHS_HR;

-- grant IHS database privileges to IHS role
GRANT ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK
	, CREATE SEQUENCE, CREATE SESSION, CREATE SYNONYM, CREATE TABLE, CREATE VIEW
	, CREATE PROCEDURE
	TO HHS_IHS_HR_RW_ROLE
;


-- grant workflow table access to role
BEGIN
	FOR ATAB IN (SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = 'BIZFLOW') LOOP
		EXECUTE IMMEDIATE 'GRANT ALL ON BIZFLOW.'||ATAB.TABLE_NAME||' TO BF_DEV_ROLE';
	END LOOP;
END;





---------------------------------
-- CROSS schema access
---------------------------------

-- grant the IHS database access role to bizflow database user

GRANT HHS_IHS_HR_RW_ROLE TO BIZFLOW;


-- grant WORKFLOW database access role to HHS_IHS_HR database user

GRANT BF_DEV_ROLE TO HHS_IHS_HR;


