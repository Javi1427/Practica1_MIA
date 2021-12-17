INSERT INTO vacas.LOCATION (location_type_code, location_type_name) 
	SELECT DISTINCT location_type_code, location_type_name FROM vacas.temp_locations;



INSERT IGNORE INTO vacas.GEONAME (geomane_id, 
								place_name, 
								latitude, 
								longitude, 
								gazetteer_adm_code, 
								gazetteer_adm_name,
								location_class,
                                geographic_exactness,
								location_id)
	SELECT DISTINCT vacas.temp_geonames.geomane_id,
					vacas.temp_geonames.place_name,
					vacas.temp_geonames.latitude,
					vacas.temp_geonames.longitude,
					vacas.temp_geonames.gazetteer_adm_code,
					vacas.temp_geonames.gazetteer_adm_name,
					vacas.temp_geonames.location_class,
                    vacas.temp_geonames.geographic_exactness,
					vacas.LOCATION.location_id
		FROM 
			vacas.temp_geonames,
			vacas.LOCATION
		WHERE 
			vacas.LOCATION.location_type_code = vacas.temp_geonames.location_type_code;




INSERT IGNORE INTO vacas.COUNTRY_CODE (	name,
											iso2,
											name_aiddata_code,
											name_aiddata_name,
											name_cow_alpha,
											name_cow_numeric,
											name_fao_code,
											name_fips,
											name_geonames_id,
											name_imf_code,
											name_iso2,
											name_iso3,
											name_iso_numeric,
											name_oecd_code,
											name_oecd_name,
											name_un_code,
											name_wb_code
										)
	SELECT DISTINCT name,
					iso2,					
					name_aiddata_code,
					name_aiddata_name,
					name_cow_alpha,
					name_cow_numeric,
					name_fao_code,
					name_fips,
					name_geonames_id,
					name_imf_code,
					name_iso2,
					name_iso3,
					name_iso_numeric,
					name_oecd_code,
					name_oecd_name,
					name_un_code,
					name_wb_code
		FROM
			vacas.temp_country_codes;


INSERT IGNORE INTO vacas.TYPE_STATUS(status)
	SELECT DISTINCT status FROM vacas.temp_projects;


INSERT IGNORE INTO vacas.PROJECT (
									project_id,
									is_geocoded,
									project_title,
									start_actual_isodate,
									end_actual_isodate,
									donors,
									donors_iso3,
									ad_sector_codes,
									ad_sector_names,
									id_status,
									transactions_start_year,
									transactions_end_year,
									total_commitments,
									total_disbursements,
									country_code_id
									)
	SELECT DISTINCT 
					project_id,
					is_geocoded,
					project_title,
					str_to_date(start_actual_isodate,'%d/%m/%Y'),
					str_to_date(end_actual_isodate,'%d/%m/%Y'),
					donors,
					donors_iso3,
					ad_sector_codes,
					ad_sector_names,
					vacas.TYPE_STATUS.id_status,
					transactions_start_year,
					transactions_end_year,
					total_commitments,
					total_disbursements,
					vacas.COUNTRY_CODE.country_code_id
		FROM 
			vacas.temp_projects,
			vacas.COUNTRY_CODE,
			vacas.TYPE_STATUS
		WHERE
			vacas.temp_projects.recipients = vacas.COUNTRY_CODE.name
			AND vacas.temp_projects.status = vacas.TYPE_STATUS.status;


INSERT IGNORE INTO vacas.LEVEL_1A (
									project_id,
									geomane_id,
									transactions_start_year,
									transactions_end_year,
									even_split_commitments,
									even_split_disbursements
									)
	SELECT DISTINCT vacas.temp_level_1a.project_id,
					vacas.temp_level_1a.geoname_id,
					vacas.temp_level_1a.transactions_start_year,
					vacas.temp_level_1a.transactions_end_year,
					vacas.temp_level_1a.even_split_commitments,
					vacas.temp_level_1a.even_split_disbursements
		FROM
			vacas.temp_level_1a;

INSERT IGNORE INTO vacas.CURRENCY(transaction_currency)
	SELECT DISTINCT transaction_currency FROM vacas.temp_transaction;


INSERT  INTO vacas.TRANSACTION
	(SELECT 		transaction_id,
					project_id,
					str_to_date(transaction_isodate,'%d/%m/%Y'),
					transaction_year,
					transaction_value_code,
					vacas.CURRENCY.id_currency,
					transaction_value
		FROM
			vacas.temp_transaction,
			vacas.CURRENCY
		WHERE 
			vacas.temp_transaction.transaction_currency = vacas.CURRENCY.transaction_currency);