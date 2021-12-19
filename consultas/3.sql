-- ======================================================c0sulta# 3 cual fue el proyecto de menor duracion?====================================================================


SELECT DATEDIFF(vacas.PROJECT.end_actual_isodate, vacas.PROJECT.start_actual_isodate) AS Cantidad_Dias, vacas.PROJECT.project_title
	FROM
		vacas.PROJECT
	WHERE 
		vacas.PROJECT.end_actual_isodate IS NOT NULL
    order by Cantidad_Dias ASC
    LIMIT 1;