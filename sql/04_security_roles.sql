-- Role-Based Access Control (RBAC) setup

-- 1. Reporting role (Read-only access)
CREATE LOGIN reportingUser WITH PASSWORD = 'ReportUser123!';
CREATE USER reportingUser FOR LOGIN reportingUser;
CREATE ROLE ReportingRole;
GRANT SELECT ON Guest TO ReportingRole;
GRANT SELECT ON Room TO ReportingRole;
GRANT SELECT ON RoomType TO ReportingRole;
GRANT SELECT ON Booking TO ReportingRole;
GRANT SELECT ON Payment TO ReportingRole;
GRANT SELECT ON Invoice TO ReportingRole;
ALTER ROLE ReportingRole ADD MEMBER reportingUser;

-- 2. Data Importer role (Selective read/write access)
CREATE LOGIN dataImporter WITH PASSWORD = 'ImportData123!';
CREATE USER dataImporter FOR LOGIN dataImporter;
CREATE ROLE DataImporterRole;
GRANT SELECT, INSERT, UPDATE ON Guest TO DataImporterRole;
GRANT SELECT, INSERT, UPDATE ON Room TO DataImporterRole;
GRANT SELECT, INSERT, UPDATE ON Service TO DataImporterRole;
GRANT SELECT, INSERT, UPDATE ON Payment TO DataImporterRole;
ALTER ROLE DataImporterRole ADD MEMBER dataImporter;

-- 3. Application role (Transactional application operations)
CREATE LOGIN appUser WITH PASSWORD = 'ApplicationUser123!';
CREATE USER appUser FOR LOGIN appUser;
CREATE ROLE ApplicationRole;
GRANT INSERT, SELECT ON Booking TO ApplicationRole;
GRANT INSERT, SELECT ON Payment TO ApplicationRole;
GRANT INSERT, SELECT ON Feedback TO ApplicationRole;
GRANT INSERT, SELECT ON ServiceUsage TO ApplicationRole;
GRANT SELECT ON Guest TO ApplicationRole;
GRANT SELECT ON Room TO ApplicationRole;
GRANT SELECT ON RoomType TO ApplicationRole;
GRANT SELECT ON Service TO ApplicationRole;
ALTER ROLE ApplicationRole ADD MEMBER appUser;
