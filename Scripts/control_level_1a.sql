LOAD DATA
LOCAL INFILE '/home/javier/practica1/Practica1_MIA/ArchivosCSV/level_1a.csv'
INTO TABLE vacas.temp_level_1a
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(	project_id,
	project_location_id,
	geoname_id,
	transactions_start_year,
	transactions_end_year,
	even_split_commitments,
	even_split_disbursements
);

SELECT count(*) FROM vacas.temp_level_1a;
SELECT * FROM vacas.temp_level_1a;

SELECT count(*) FROM vacas.CURRENCY;
SELECT count(*) FROM vacas.TYPE_STATUS;
SELECT count(*) FROM vacas.TRANSACTION;