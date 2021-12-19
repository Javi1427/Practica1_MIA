-- ===================================consulta6 cuall fue el proyecto con más costo?=====================================================

SELECT vacas.PROJECT.project_title, vacas.PROJECT.total_commitments 
	FROM vacas.PROJECT
    order by vacas.PROJECT.total_commitments DESC
    LIMIT 1;