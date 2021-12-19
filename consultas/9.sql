-- ================================================consulta 9 costo total de todos los proyectos======================================================

SELECT SUM(vacas.PROJECT.total_commitments) AS Total
	FROM vacas.PROJECT;