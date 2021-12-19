#!/bin/bash
 

servername=localhost
usuario=root
password=1234
database=vacas

echo "Escriba si es administrador o empleado"
 
read puesto
 
 
# Creo todas las opciones del menú 
 
Opcion1="Eliminar tabla"
Opcion2="Crear Tablas"
Opcion3="Crear Temporales"
Opcion4="Ejecutar los controles"
Opcion5="Llenar la BD"
Opcion6="Salir"
 
Opcione1="¿Cuántos proyectos iniciaron en el 2011?"
Opcione2="¿Cuál fue el proyecto de mayor duración?"
Opcione3="¿Cuál fue el proyecto de menor duración?"
Opcione4="Top 5 de países con más proyectos asignados"
Opcione5="Top 5 de países con menos proyectos asignados"
Opcione6="¿Cuál fue el proyecto con más costo?"
Opcione7="¿Cuál fue el proyecto menos costoso?"
Opcione8="Top 5 de proyectos más costosos"
Opcione9="Costo Total de Todos los Proyectos"
Opcione10="Top 3 de las Transacciones más Costosas RI-East Africa Public Health Laboratory Networking Project"
Opcione11="Salir"
 



if [ "$puesto" = "administrador"  ]; then 
# Creo el cuerpo del menú en cuestión , empezando de arriba a abajo ya que primero confeccioné la opción "Salir"
 
select opcion in "$Opcion1" "$Opcion2" "$Opcion3" "$Opcion4" "$Opcion5" "$Opcion6" ;
do
    if [ "$opcion" = "$Opcion6"  ]; then 
        echo "Saliendo del programa"
        exit 
 
        #se llena la base de datos
    elif [ "$opcion" = "$Opcion5" ]; then
    echo "Llenando la BD"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/LLenarBD.sql
    echo "Ingrese opcion: "

    #se suben los scripts de control 
    elif [ "$opcion" = "$Opcion4" ]; then  
    echo "Ejecutando Scripts de control de Country"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/Control_country.sql
    echo "Ejecutando Scripts de control de Geonames"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/control_geonames.sql
    echo "Ejecutando Scripts de control de Level 1a"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/control_level_1a.sql
    echo "Ejecutando Scripts de control de Location"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/Control_Location.sql
    echo "Ejecutando Scripts de control de Proyects"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/Control_proyects.sql
    echo "Ejecutando Scripts de control de Transaction"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/control_transaction.sql
    echo "Subida temporales con exito"
    echo "Ingrese opcion: "

 
 
    elif [ "$opcion" = "$Opcion3" ]; then
    echo "Creacion de tablas temporales"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/Creacion_Temporales.sql
    echo "Creacion de tablas temporales con exito."
    echo "Ingrese opcion: "
 
 
    elif [ "$opcion" = "$Opcion2" ]; then
    echo "Creando tablas..."
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/Creacion.sql
    echo "Tablas creadas con exito."
    echo "Ingrese opcion: "
 
 
    elif [ "$opcion" = "$Opcion1" ]; then 
    echo "Eliminar tablas"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/Scripts/Eliminacion_de_tablas.sql
    echo "Tablas eliminadas"
    echo "Ingrese opcion: "
 
    else
        echo "Opción no válida" # P
    fi
    done

    else 

       select opcione in "$Opcione1" "$Opcione2" "$Opcione3" "$Opcione4" "$Opcione5" "$Opcione6" "$Opcione7" "$Opcione8" "$Opcione9" "$Opcione10" "$Opcione11" ;
    do
    if [ "$opcione" = "$Opcione11"  ]; then 
        echo "Saliendo del programa"
        exit 
 
        #se llena la base de datos
    elif [ "$opcione" = "$Opcione10" ]; then
    echo "Top 3 de las Transacciones más Costosas RI-East Africa Public Health Laboratory Networking Project"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/10.sql
    echo "Ingrese opcion: "

    #se suben los scripts de control 
    elif [ "$opcione" = "$Opcione9" ]; then  
    echo "Costo Total de Todos los Proyectos"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/9.sql
    echo "Ingrese opcion: "

 
 
    elif [ "$opcione" = "$Opcione8" ]; then
    echo "Top 5 de proyectos más costosos"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/8.sql
    echo "Ingrese opcion: "
 
 
    elif [ "$opcione" = "$Opcione7" ]; then
    echo "¿Cuál fue el proyecto menos costoso?"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/7.sql
    echo "Ingrese opcion: "
 
 
    elif [ "$opcione" = "$Opcione6" ]; then 
    echo "¿Cuál fue el proyecto con más costo?"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/6.sql
    echo "Ingrese opcion: "


    elif [ "$opcione" = "$Opcione5" ]; then 
    echo "Top 5 de países con menos proyectos asignados"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/5.sql
    echo "Ingrese opcion: "

    elif [ "$opcione" = "$Opcione4" ]; then
    echo "Top 5 de países con más proyectos asignados"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/4.sql
    echo "Ingrese opcion: "

    elif [ "$opcione" = "$Opcione3" ]; then
    echo "¿Cuál fue el proyecto de menor duración?"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/3.sql
    echo "Ingrese opcion: "

    elif [ "$opcione" = "$Opcione2" ]; then
    echo "¿Cuál fue el proyecto de mayor duración?"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/2.sql
    echo "Ingrese opcion: "

    elif [ "$opcione" = "$Opcione1" ]; then
    echo "¿Cuántos proyectos iniciaron en el 2011?"
    mysql -uroot -p1234 vacas < /home/javier/practica1/Practica1_MIA/consultas/1.sql
    echo "Ingrese opcion: "
 
    else
        echo "Opción no válida" # P 
    fi
    done


    fi

