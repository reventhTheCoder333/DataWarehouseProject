CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS 
BEGIN
    DECLARE @SourcePath NVARCHAR(500) = 'C:\SQLData\'; 

    BEGIN TRY
        TRUNCATE TABLE bronze.crm_cust_info;
        EXEC ('BULK INSERT bronze.crm_cust_info FROM ''' + @SourcePath + 'datasets\source_crm\cust_info.csv'' WITH (FIRSTROW = 2, FIELDTERMINATOR = '','', TABLOCK)');

        TRUNCATE TABLE bronze.crm_prd_info;
        EXEC ('BULK INSERT bronze.crm_prd_info FROM ''' + @SourcePath + 'datasets\source_crm\prd_info.csv'' WITH (FIRSTROW = 2, FIELDTERMINATOR = '','', TABLOCK)');

        TRUNCATE TABLE bronze.crm_sales_details;
        EXEC ('BULK INSERT bronze.crm_sales_details FROM ''' + @SourcePath + 'datasets\source_crm\sales_details.csv'' WITH (FIRSTROW = 2, FIELDTERMINATOR = '','', TABLOCK)');

        TRUNCATE TABLE bronze.erp_cust_az12;
        EXEC ('BULK INSERT bronze.erp_cust_az12 FROM ''' + @SourcePath + 'datasets\source_erp\CUST_AZ12.csv'' WITH (FIRSTROW = 2, FIELDTERMINATOR = '','', TABLOCK)');

        TRUNCATE TABLE bronze.erp_loc_a101;
        EXEC ('BULK INSERT bronze.erp_loc_a101 FROM ''' + @SourcePath + 'datasets\source_erp\LOC_A101.csv'' WITH (FIRSTROW = 2, FIELDTERMINATOR = '','', TABLOCK)');

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        EXEC ('BULK INSERT bronze.erp_px_cat_g1v2 FROM ''' + @SourcePath + 'datasets\source_erp\PX_CAT_G1V2.csv'' WITH (FIRSTROW = 2, FIELDTERMINATOR = '','', TABLOCK)');

    END TRY
    BEGIN CATCH
        PRINT '~~~~~~~~~~~~~~~~~~~~~~~~';
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
    END CATCH
END;
