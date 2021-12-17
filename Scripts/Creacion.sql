USE vacas;

CREATE TABLE IF NOT EXISTS vacas.COUNTRY_CODE(
	country_code_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(500) NOT NULL,
	iso2 VARCHAR(10)NOT NULL,
    name_name VARCHAR(500)NOT NULL,
	name_aiddata_code INT NOT NULL,
	name_aiddata_name VARCHAR(500)NOT NULL,
	name_cow_alpha VARCHAR(10)NOT NULL,
	name_cow_numeric INT NOT NULL,
	name_fao_code INT NOT NULL,
	name_fips VARCHAR(10)NOT NULL,
	name_geonames_id INT NOT NULL,
	name_imf_code INT NOT NULL,
	name_iso2 VARCHAR(10)NOT NULL,
	name_iso3 VARCHAR(10)NOT NULL,
	name_iso_numeric INT NOT NULL,
	name_oecd_code INT NOT NULL,
	name_oecd_name VARCHAR(500)NOT NULL,
	name_un_code INT NOT NULL,
	name_wb_code VARCHAR(10)NOT NULL,
	PRIMARY KEY(country_code_id)
);

CREATE TABLE IF NOT EXISTS vacas.LOCATION(
	location_id INT NOT NULL AUTO_INCREMENT,
	location_type_code VARCHAR(500) NOT NULL,
	location_type_name VARCHAR(500) NOT NULL,
	PRIMARY KEY(location_id)
);

CREATE TABLE IF NOT EXISTS vacas.GEONAME(
	location_id INT NOT NULL,
	geomane_id INT NOT NULL AUTO_INCREMENT,
	place_name VARCHAR(500) NOT NULL,
	latitude DOUBLE  NOT NULL,
	longitude DOUBLE  NOT NULL,
	gazetteer_adm_code VARCHAR(500) NOT NULL,
	gazetteer_adm_name VARCHAR(500) NOT NULL,
	location_class INT NOT NULL,
	geographic_exactness INT,
	PRIMARY KEY(geomane_id),
	FOREIGN KEY (location_id) REFERENCES vacas.LOCATION(location_id)
);


CREATE TABLE IF NOT EXISTS vacas.TYPE_STATUS(
	id_status INT NOT NULL AUTO_INCREMENT,
	status VARCHAR(500),
	PRIMARY KEY(id_status)
);

CREATE TABLE IF NOT EXISTS vacas.PROJECT(
	project_id VARCHAR(50) NOT NULL,
	is_geocoded INT,
	project_title VARCHAR(500) NOT NULL,
	start_actual_isodate DATE NOT NULL,
	end_actual_isodate DATE,
	donors VARCHAR(50),
	donors_iso3 VARCHAR(10),
    recipients VARCHAR(200),
    recipients_iso3 VARCHAR(200),
	ad_sector_codes VARCHAR(500),
	ad_sector_names VARCHAR(500),
	id_status INT,
	transactions_start_year YEAR,
	transactions_end_year YEAR,
	total_commitments DOUBLE ,
	total_disbursements DOUBLE ,
	country_code_id INT NOT NULL,
	PRIMARY KEY(project_id),
	FOREIGN KEY (country_code_id) REFERENCES vacas.COUNTRY_CODE(country_code_id),
	FOREIGN KEY (id_status) REFERENCES vacas.TYPE_STATUS(id_status)
);

CREATE TABLE IF NOT EXISTS vacas.LEVEL_1A(
	project_id VARCHAR(50) NOT NULL,
    project_location_id VARCHAR(50),
	geomane_id INT NOT NULL,
	transactions_start_year YEAR NOT NULL,
	transactions_end_year YEAR NOT NULL,
	even_split_commitments DOUBLE  NOT NULL,
	even_split_disbursements DOUBLE,
	FOREIGN KEY (project_id) REFERENCES vacas.PROJECT(project_id),
	FOREIGN KEY (geomane_id) REFERENCES vacas.GEONAME(geomane_id)
);

CREATE TABLE IF NOT EXISTS vacas.CURRENCY(
	id_currency INT AUTO_INCREMENT,
	transaction_currency VARCHAR(50),
	PRIMARY KEY(id_currency)
);

CREATE TABLE IF NOT EXISTS vacas.TRANSACTION(
	transaction_id VARCHAR(500) NOT NULL,
	project_id VARCHAR(50) NOT NULL,
	transaction_isodate DATE NOT NULL,
	transaction_year YEAR NOT NULL,
	transaction_value_code VARCHAR(10) NOT NULL,
	id_currency INT NOT NULL,
	transaction_value DOUBLE NOT NULL,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (project_id) REFERENCES vacas.PROJECT(project_id),
	FOREIGN KEY (id_currency) REFERENCES vacas.CURRENCY(id_currency)
);




