-- consulta 10 top 3 de las transacciones más costosas RI-East africa public health laboratory networking project

SELECT vacas.PROJECT.project_title AS Proyecto, vacas.temp_transaction.transaction_id AS ID, vacas.temp_transaction.transaction_value AS Costo 
	FROM 
		vacas.PROJECT,
		vacas.temp_transaction
	WHERE 
		vacas.PROJECT.project_title = 'AFCC2/RI-East Africa Public Health Laboratory Networking Project'
		AND vacas.temp_transaction.project_id = vacas.PROJECT.project_id
        ORDER BY Costo DESC
        LIMIT 3;