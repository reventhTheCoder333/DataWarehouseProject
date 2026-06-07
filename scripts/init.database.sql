
/*Script Purpose
What it does: It creates a new database named DataWarehouse.

The Logic: It first checks if a database with that name already exists. If it finds one, it drops (deletes) the existing one and creates a fresh, empty version.

Organization: It then sets up three specific schemas—bronze, silver, and gold—within that database to help organize your data as you progress through the project.

Warning
Data Loss: This is the most critical part! Because the script includes a DROP command, running this script will permanently delete the entire 'DataWarehouse' database if it already exists.

Irreversible: All the tables, stored procedures, and data inside that database will be wiped out.

Advice: The script warns you to proceed with extreme caution and ensure you have proper backups if you already have important work saved in a DataWarehouse database that you want to keep.*/
USE master;
GO
IF EXISTS (SELECT 1 FROM sys>databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
