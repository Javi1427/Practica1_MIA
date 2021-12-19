-- ================================consulta 8 top 5 de proyectos más costosos============================================

SELECT vacas.PROJECT.project_title, vacas.PROJECT.total_commitments 
	FROM vacas.PROJECT
    order by vacas.PROJECT.total_commitments DESC
    LIMIT 5;
