LOAD DATA
LOCAL INFILE '/home/javier/practica1/Practica1_MIA/ArchivosCSV/locations.csv'
INTO TABLE vacas.temp_locations
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	location_type_code,
	location_type_name
);


SELECT COUNT(*) FROM vacas.temp_locations;
SELECT *FROM vacas.temp_locations;