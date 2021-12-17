LOAD DATA
LOCAL INFILE '/home/javier/practica1/Practica1_MIA/ArchivosCSV/country_codes.tsv'
INTO TABLE vacas.temp_country_codes
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(	name,
	iso2,
	name_name,
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
);


SELECT count(*) FROM vacas.temp_country_codes;
SELECT *FROM vacas.temp_country_codes;	