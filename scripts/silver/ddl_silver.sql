	/* SILVER LAYER */
/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
	
If OBJECT_ID('silver.crm_cust_info','U') is not null
	Drop table silver.crm_cust_info;
		-- In the above code U represents the USER , the User defined tables -- 
			create table silver.crm_cust_info(
				cst_id int,
				cst_key varchar(50),
				cst_firstname varchar(50),
				cst_lastname varchar(50),
				cst_material_status varchar(50),
				cst_gndr varchar(50),
				cst_create_date date,
				dwh_create_date datetime2 default getdate()
			);


	If OBJECT_ID('silver.crm_prd_info','U') is not null
	Drop table silver.crm_prd_info;
			create table silver.crm_prd_info(
				prd_id int,
				cat_id varchar(50),/*this table is modified after creating the table beacuse the cat_id column was not there is extracted from the prd_key */
				prd_key varchar(50),
				prd_nm varchar(50),
				prd_cost varchar(50),
				prd_line varchar(50),
				prd_start_dt date,
				prd_end_dt date,
				dwh_create_date datetime2 default getdate()
			);


	If OBJECT_ID('silver.crm_sales_details','U') is not null
	Drop table silver.crm_sales_details;
			create table silver.crm_sales_details(
				sls_ord_num varchar(50),
				sls_prd_key varchar(50),
				sls_cust_id int,
				sls_order_dt date,
				sls_ship_dt date,
				sls_due_dt date,
				sls_sales int,
				sls_quantity int,
				sls_price int,
				dwh_create_date datetime2 default getdate()
			);


	If OBJECT_ID('silver.erp_cust_az12','U') is not null
	Drop table silver.erp_cust_az12;
			create table silver.erp_cust_az12(
				cid varchar(50),
				bdate date,
				gen varchar(50),
				dwh_create_date datetime2 default getdate()
			);


	If OBJECT_ID('silver.erp_loc_a101','U') is not null
	Drop table silver.erp_loc_a101;
				create table silver.erp_loc_a101(
				cid varchar(50),
				cntry varchar(50),
				dwh_create_date datetime2 default getdate()
			);


	If OBJECT_ID('silver.erp_px_cat_g1v2','U') is not null
	Drop table silver.erp_px_cat_g1v2;
				create table silver.erp_px_cat_g1v2(
				id varchar(50),
				cat varchar(50),
				subcat varchar(50),
				maintenance varchar(50),
				dwh_create_date datetime2 default getdate()
			);

