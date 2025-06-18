use escuela;
###############CONSULTAS CON GROUP BY #########################
#Listado de los alumnos (nombre) y su promedio de notas
SELECT a.NOMBRE,AVG(c.NOTA) FROM ALUMNO a 
INNER JOIN CURSA c ON a.LEGAJO = c.LEGAJO
GROUP BY a.LEGAJO;
#Calcular la cantidad de alumnos por ciudad
SELECT CIUDAD,COUNT(NOMBRE) FROM ALUMNO
GROUP BY CIUDAD;
#Mostrar la cantidad de materias que cada docente dicta
SELECT d.LEGAJO,COUNT(m.NOMBRE) AS cantidad_docente
FROM DOCENTE d
INNER JOIN DICTA dic ON d.LEGAJO = dic.LEGAJO
INNER JOIN MATERIA m ON dic.CODIGO = m.CODIGO
GROUP BY d.LEGAJO;
#4 Calcular la nota promedio de cada materia
SELECT MATERIA.NOMBRE, AVG(NOTA) NotaPromedio 
FROM MATERIA 
INNER JOIN CURSA ON MATERIA.CODIGO = CURSA.CODIGO 
GROUP BY MATERIA.NOMBRE;
#Mostrar la cantidad de alumnos que han obtenido una nota superior a 7 en cada materia
SELECT m.NOMBRE,COUNT(*) cantidad_notas
FROM MATERIA m
INNER JOIN CURSA c ON m.CODIGO = c.CODIGO
WHERE NOTA > 7
GROUP BY m.NOMBRE;
#Calcular la cantidad de docentes que viven en cada ciudad
SELECT CIUDAD,COUNT(*) CANT_VIVEN
FROM DOCENTE
GROUP BY CIUDAD;
#Listar las ciudades donde hay al menos 2 alumnos
SELECT CIUDAD, COUNT(*) cantidadAlumnos 
FROM ALUMNO 
GROUP BY CIUDAD HAVING COUNT(*) >= 2;
#Listar las materias donde los alumnos tienen una nota promedio mayor a 9
SELECT m.NOMBRE  ,COUNT(*)  AS MAYOR_A9
FROM MATERIA m
INNER JOIN CURSA c ON m.CODIGO = c.CODIGO
GROUP BY m.NOMBRE HAVING AVG(c.NOTA) >= 9;
#--Listar las ciudades donde al menos 2 docentes viven en la misma
SELECT CIUDAD,COUNT(*) CANT_VIVEN
FROM DOCENTE
GROUP BY CIUDAD HAVING COUNT(*) >= 2;
#Mencionar el nombre de las materias junto a la cantidad de alumnos que poseen nota mayor a 9
SELECT m.NOMBRE,COUNT(*) AS CACA FROM MATERIA M
INNER JOIN CURSA c ON m.CODIGO = c.CODIGO
WHERE c.NOTA >= 9
GROUP BY m.NOMBRE;
#11 Mostrar el promedio de nota de los alumnos por ciudad, solo indicar las que posean un promedio mayor a 8,50
SELECT ALUMNO.CIUDAD, AVG(CURSA.NOTA) PromedioNota 
FROM ALUMNO 
INNER JOIN CURSA ON ALUMNO.LEGAJO = CURSA.LEGAJO 
GROUP BY ALUMNO.CIUDAD HAVING AVG(CURSA.NOTA) > 8.50;
#12 Listado de alumnos que sólo cursan dos materias
SELECT A.LEGAJO, A.NOMBRE NombreAlumno 
FROM ALUMNO A 
INNER JOIN CURSA C ON A.LEGAJO = C.LEGAJO 
GROUP BY A.LEGAJO, A.NOMBRE HAVING COUNT(DISTINCT C.CODIGO) = 2;
#13 Listado de las materias con su nota mayor y menor
SELECT m.NOMBRE AS Materia, MAX(c.NOTA) AS NotaMayor,   MIN(c.NOTA) AS NotaMenor 
FROM MATERIA m
INNER JOIN CURSA c ON m.CODIGO = c.CODIGO 
GROUP BY m.NOMBRE;
#14 Obtener la nota máxima, mínima y el promedio de cada alumno
SELECT a.NOMBRE AS NombreAlumno, 
		MAX(c.NOTA) AS NotaMaxima, 
        MIN(c.NOTA) AS NotaMinima, 
        AVG(c.NOTA) AS NotaProm 
FROM ALUMNO a
INNER JOIN CURSA c ON a.LEGAJO = c.LEGAJO 
GROUP BY a.NOMBRE;
#15 Calcular la suma total de notas por materia
SELECT m.NOMBRE AS Materia, SUM(c.NOTA) AS SumaNotas 
FROM MATERIA m
INNER JOIN CURSA c ON m.CODIGO = c.CODIGO 
GROUP BY m.NOMBRE;
