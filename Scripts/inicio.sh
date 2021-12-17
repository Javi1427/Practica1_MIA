#!/bin/sh
#### Defino los parametros de conexión a la BD mysql
servername=localhost
usuario=root
password=1234
database=vacas


echo ======= USUARIOS ========
echo 1. Eliminar
echo 2. Crear
echo 3. Salir 
echo =========================



mysql -uroot -p vacas < /home/javier/practica1/Practica1_MIA/Scripts/Eliminacion_de_tablas.sql



echo despues de la consulta
