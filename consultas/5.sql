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