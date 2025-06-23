/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/



If OBJECT_ID('bronze.crm_cust_info','U') is not null
Drop table bronze.crm_cust_info;
	-- In the above code U represents the USER , the User defined tables -- 
		create table bronze.crm_cust_info(
			cst_id int,
			cst_key varchar(50),
			cst_firstname varchar(50),
			cst_lastname varchar(50),
			cst_material_status varchar(50),
			cst_gndr varchar(50),
			cst_create_date date
		);


If OBJECT_ID('bronze.crm_prd_info','U') is not null
Drop table bronze.crm_prd_info;
		create table bronze.crm_prd_info(
			prd_id int,
			prd_key varchar(50),
			prd_nm varchar(50),
			prd_cost varchar(50),
			prd_line varchar(50),
			prd_start_dt date,
			prd_end_dt date
		);


If OBJECT_ID('bronze.crm_sales_details','U') is not null
Drop table bronze.crm_sales_details;
		create table bronze.crm_sales_details(
			sls_ord_num varchar(50),
			sls_prd_key varchar(50),
			sls_cust_id varchar(50),
			sls_order_dt varchar(50),
			sls_ship_dt varchar(50),
			sls_due_dt varchar(50),
			sls_sales varchar(50),
			sls_quantity varchar(50),
			sls_price varchar(50)
		);


If OBJECT_ID('bronze.erp_cust_az12','U') is not null
Drop table bronze.erp_cust_az12;
		create table bronze.erp_cust_az12(
			cid varchar(50),
			bdate date,
			gen varchar(50)
		);


If OBJECT_ID('bronze.erp_loc_a101','U') is not null
Drop table bronze.erp_loc_a101;
			create table bronze.erp_loc_a101(
			cid varchar(50),
			cntry varchar(50)
		);


If OBJECT_ID('bronze.erp_px_cat_g1v2','U') is not null
Drop table bronze.erp_px_cat_g1v2;
			create table bronze.erp_px_cat_g1v2(
			id varchar(50),
			cat varchar(50),
			subcat varchar(50),
			maintenance varchar(50),
		);
