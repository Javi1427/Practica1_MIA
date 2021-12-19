-- ============================================consulta #1 cuantos proyectos iniciaron en el 2011?==============================================
SELECT COUNT(vacas.PROJECT.project_id) AS Conteo
	FROM
		vacas.PROJECT
	WHERE YEAR(vacas.PROJECT.start_actual_isodate) = 2011;