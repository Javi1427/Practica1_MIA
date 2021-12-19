-- ===============================consulta 7 cuall fue el proyecto menos costoso========================================================

SELECT vacas.PROJECT.project_title, vacas.PROJECT.total_commitments 
	FROM vacas.PROJECT
    WHERE 
    	vacas.PROJECT.total_commitments > 0
    order by vacas.PROJECT.total_commitments ASC
    LIMIT 1;
