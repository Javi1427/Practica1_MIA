CREATE TABLE IF NOT EXISTS vacas.temp_locations(
	location_type_code VARCHAR(500),
	location_type_name VARCHAR(500)
);	

CREATE TABLE IF NOT EXISTS vacas.temp_country_codes(
	name VARCHAR(500)NOT NULL,
	iso2 VARCHAR(500),
	name_name VARCHAR(500),
	name_aiddata_code INT NOT NULL,
	name_aiddata_name VARCHAR(500),
	name_cow_alpha VARCHAR(500),
	name_cow_numeric INT NOT NULL, 
	name_fao_code INT NOT NULL,
	name_fips VARCHAR(500),
	name_geonames_id INT NOT NULL,
	name_imf_code INT NOT NULL,
	name_iso2 VARCHAR(500),
	name_iso3 VARCHAR(500),
	name_iso_numeric INT NOT NULL,
	name_oecd_code INT NOT NULL,
	name_oecd_name VARCHAR(500),
	name_un_code INT NOT NULL,
	name_wb_code VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS vacas.temp_geonames(
	geomane_id VARCHAR(500) NOT NULL,
	place_name VARCHAR(500) NOT NULL,
	latitude VARCHAR(500) NOT NULL,
	longitude VARCHAR(500) NOT NULL,
	location_type_code VARCHAR(500) NOT NULL,
	location_type_name VARCHAR(500) NOT NULL,
	gazetteer_adm_code VARCHAR(500) NOT NULL,
	gazetteer_adm_name VARCHAR(500) NOT NULL,
	location_class VARCHAR(500) NOT NULL,
	geographic_exactness VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS vacas.temp_level_1a(
	project_id VARCHAR(500),
	project_location_id VARCHAR(500),
	geoname_id VARCHAR(500),
	transactions_start_year VARCHAR(500),
	transactions_end_year VARCHAR(500),
	even_split_commitments VARCHAR(500),
	even_split_disbursements DOUBLE
);

CREATE TABLE IF NOT EXISTS vacas.temp_projects(
	project_id VARCHAR(500),
	is_geocoded VARCHAR(500),
	project_title VARCHAR(500),
	start_actual_isodate VARCHAR(500),
	end_actual_isodate VARCHAR(500),
	donors VARCHAR(500),
	donors_iso3 VARCHAR(500),
	recipients VARCHAR(500),
	recipients_iso3 VARCHAR(500),
	ad_sector_codes VARCHAR(500),
	ad_sector_names VARCHAR(500),
	status VARCHAR(500),
	transactions_start_year YEAR,
	transactions_end_year YEAR,
	total_commitments DOUBLE,
	total_disbursements DOUBLE
);

CREATE TABLE IF NOT EXISTS vacas.temp_transaction(
	transaction_id VARCHAR(500),
	project_id VARCHAR(500),
	transaction_isodate VARCHAR(500),
	transaction_year VARCHAR(500),
	transaction_value_code VARCHAR(500),
	transaction_currency VARCHAR(500),
	transaction_value DOUBLE NOT NULL
);