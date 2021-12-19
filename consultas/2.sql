
-- =================================================consulta #2  cual fue el proyecto de mayor duracion?============================================================

SELECT DATEDIFF(vacas.PROJECT.end_actual_isodate, vacas.PROJECT.start_actual_isodate) AS Cantidad_Dias, vacas.PROJECT.project_title
	FROM
		vacas.PROJECT
    order by Cantidad_Dias DESC
    LIMIT 1;
