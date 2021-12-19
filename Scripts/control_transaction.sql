LOAD DATA
LOCAL INFILE '/home/javier/practica1/Practica1_MIA/ArchivosCSV/transactions.csv'
INTO TABLE vacas.temp_transaction
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(	transaction_id,
	project_id,
	transaction_isodate,
	transaction_year,
	transaction_value_code,
	transaction_currency,
	transaction_value
);
