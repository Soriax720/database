use escuela;
####### CONSULTAS ORDER BY #############
select nombre from docente
ORDER BY NOMBRE ASC; #Obtener los nombres de los docentes y mostrarlos en forma ascendente

#Obtener los nombres de los alumnos ordenados a través de tu legajo de mayor a menor
SELECT NOMBRE,LEGAJO FROM ALUMNO
ORDER BY LEGAJO DESC;

#Obtener las materias ordenadas en forma descendente
SELECT NOMBRE FROM MATERIA
ORDER BY NOMBRE DESC;

#ciudad sea distinta a “Buenos Aires” ordenados por su legajo de menor a mayor
SELECT NOMBRE,CIUDAD,LEGAJO FROM DOCENTE
WHERE CIUDAD != 'Buenos Aires'
ORDER BY LEGAJO DESC;

#Listar las materias que contengan la letra ‘e’ en forma descendente
SELECT NOMBRE FROM MATERIA
WHERE NOMBRE LIKE '%e%'
ORDER BY NOMBRE DESC