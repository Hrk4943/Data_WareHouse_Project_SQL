/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


	/*
	Save frequently usesd SQL code in the stored procedure in the database
	*/
Create or alter procedure bronze.load_bronze as
begin

	/* 
	Declaring 2 variables to know the time duration of each table loading
	*/
	Declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime 

	begin try
	/*first of all delete all the data from the table then bulk insert 
	the data otherwise it duplicate the data,for each execution.
	*/
		set @batch_start_time = GETDATE();
		print'================================================';
		print'Loading Bronze Layer';
		print'================================================';

		print'------------------------------------------------';
		print'Loading CRM Tables';
		print'------------------------------------------------';

		/* CRM DATA*/
		set @start_time = GETDATE(); 
		print'>> Truncating Table : bronze.crm_cust_info <<'
		truncate table bronze.crm_cust_info;
		print'>> Insersting Data Into : bronze.crm_cust_info <<'
		bulk insert bronze.crm_cust_info
		from 'D:\R&C\Data WareHousing Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print'>>Loading Duration : ' + Cast(Datediff(second,@start_time,@end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';


		set @start_time = GETDATE();
		print'>> Truncating Table : bronze.crm_prd_info <<'
		truncate table bronze.crm_prd_info;
		print'>> Insersting Data Into : bronze.crm_prd_info <<'
		bulk insert bronze.crm_prd_info
		from 'D:\R&C\Data WareHousing Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print'>>Loading Duration : ' + Cast(Datediff(second,@start_time,@end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';


		set @start_time = GETDATE();
		print'>> Truncating Table : bronze.crm_sales_details <<'
		truncate table bronze.crm_sales_details;
		print'>> Insersting Data Into : bronze.crm_sales_details <<'
		bulk insert bronze.crm_sales_details
		from 'D:\R&C\Data WareHousing Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print'>>Loading Duration : ' + Cast(Datediff(second,@start_time,@end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';


		print'------------------------------------------------';
		print'Loading ERP Tables';
		print'------------------------------------------------';

		/* ERP DATA */

		set @start_time = GETDATE();
		print'>> Truncating Table : bronze.erp_cust_az12 <<'
		truncate table bronze.erp_cust_az12;
		print'>> Insersting Data Into : bronze.erp_cust_az12 <<'
		bulk insert bronze.erp_cust_az12
		from 'D:\R&C\Data WareHousing Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print'>>Loading Duration : ' + Cast(Datediff(second,@start_time,@end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';


		set @start_time = GETDATE();
		print'>> Truncating Table : bronze.erp_loc_a101 <<'
		truncate table bronze.erp_loc_a101;
		print'>> Insersting Data Into : bronze.erp_loc_a101 <<'
		bulk insert bronze.erp_loc_a101
		from 'D:\R&C\Data WareHousing Project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print'>>Loading Duration : ' + Cast(Datediff(second,@start_time,@end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';


		set @start_time = GETDATE();
		print'>> Truncating Table : bronze.erp_px_cat_g1v2 <<'
		truncate table bronze.erp_px_cat_g1v2;
		print'>> Insersting Data Into : bronze.erp_px_cat_g1v2 <<'
		bulk insert bronze.erp_px_cat_g1v2
		from 'D:\R&C\Data WareHousing Project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE(); 
		print'>>Loading Duration : ' + Cast(Datediff(second,@start_time,@end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';


		set @batch_end_time = GETDATE()
		print'------------------------------------------------';
		print'Loading of Bronze Layer is completed';
		print'>> Total Load Duration : ' + Cast(Datediff(second,@batch_start_time,@batch_end_time) as varchar(50)) + 'seconds';
		print'------------------------------------------------';
	end try

	begin catch
		print'------------------------------------------------';
		print'Error Occured During the Loading';
		print'Error Message' + ERROR_MESSAGE();
		print'Error Message' + CAST(ERROR_NUMBER() AS Varchar(50));
		print'Error Message' + CAST(ERROR_STATE() AS Varchar(50));
		print'------------------------------------------------';
	end catch

end;
