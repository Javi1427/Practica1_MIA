-- ============================================consulta #1 cuantos proyectos iniciaron en el 2011?==============================================
SELECT COUNT(vacas.PROJECT.project_id) AS Conteo
	FROM
		vacas.PROJECT
	WHERE YEAR(vacas.PROJECT.start_actual_isodate) = 2011;

-- =================================================consulta #2  cual fue el proyecto de mayor duracion?============================================================

SELECT DATEDIFF(vacas.PROJECT.end_actual_isodate, vacas.PROJECT.start_actual_isodate) AS Cantidad_Dias, vacas.PROJECT.project_title
	FROM
		vacas.PROJECT
    order by Cantidad_Dias DESC
    LIMIT 1;

-- ======================================================c0sulta# 3 cual fue el proyecto de menor duracion?====================================================================


SELECT DATEDIFF(vacas.PROJECT.end_actual_isodate, vacas.PROJECT.start_actual_isodate) AS Cantidad_Dias, vacas.PROJECT.project_title
	FROM
		vacas.PROJECT
	WHERE 
		vacas.PROJECT.end_actual_isodate IS NOT NULL
    order by Cantidad_Dias ASC
    LIMIT 1;

-- ==========================consulta 4 top 5 de paises con mas proyectos asignados==================================

SELECT vacas.COUNTRY_CODE.name AS Pais, COUNT(vacas.PROJECT.country_code_id) AS Cantidad
	FROM 
		vacas.COUNTRY_CODE,
		vacas.PROJECT
	WHERE 
		vacas.COUNTRY_CODE.country_code_id = vacas.PROJECT.country_code_id
	group by Pais
    order by Cantidad DESC
    LIMIT 5;

-- ============================================ consulta 5  top 5 de paises con menos proyectos asignados================


SELECT vacas.COUNTRY_CODE.name AS Pais, COUNT(vacas.PROJECT.country_code_id) AS Cantidad
	FROM 
		vacas.COUNTRY_CODE,
		vacas.PROJECT
	WHERE 
		vacas.COUNTRY_CODE.country_code_id = vacas.PROJECT.country_code_id
	group by Pais
    order by Cantidad ASC
    LIMIT 5;

-- ===================================consulta6 cuall fue el proyecto con más costo?=====================================================

SELECT vacas.PROJECT.project_title, vacas.PROJECT.total_commitments 
	FROM vacas.PROJECT
    order by vacas.PROJECT.total_commitments DESC
    LIMIT 1;

-- ===============================consulta 7 cuall fue el proyecto menos costoso========================================================

SELECT vacas.PROJECT.project_title, vacas.PROJECT.total_commitments 
	FROM vacas.PROJECT
    WHERE 
    	vacas.PROJECT.total_commitments > 0
    order by vacas.PROJECT.total_commitments ASC
    LIMIT 1;

-- ================================consulta 8 top 5 de proyectos más costosos============================================

SELECT vacas.PROJECT.project_title, vacas.PROJECT.total_commitments 
	FROM vacas.PROJECT
    order by vacas.PROJECT.total_commitments DESC
    LIMIT 5;

-- ================================================consulta 9 costo total de todos los proyectos======================================================

SELECT SUM(vacas.PROJECT.total_commitments) AS Total
	FROM vacas.PROJECT;

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