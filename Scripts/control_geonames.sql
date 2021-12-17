LOAD DATA
LOCAL INFILE '/home/javier/practica1/Practica1_MIA/ArchivosCSV/geonames.csv'
INTO TABLE vacas.temp_geonames
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(	geomane_id,
	place_name,
	latitude,
	longitude,
	location_type_code,
	location_type_name,
	gazetteer_adm_code,
	gazetteer_adm_name,
	location_class,
	geographic_exactness
);

#DELETE FROM vacas.temp_geonames;

SELECT count(*) FROM vacas.temp_geonames;
SELECT * FROM vacas.temp_geonames;