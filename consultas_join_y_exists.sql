use escuela;
####### CONSULTAS JOIN,IN EXISTSi
SELECT NOMBRE,CODIGO FROM MATERIA
WHERE CODIGO BETWEEN 2 AND 4;

#ciudades sin repetirlas en las que viven los alumnos.
SELECT DISTINCT CIUDAD FROM ALUMNO;

#nombres de los docentes que viven en las ciudades de "Buenos Aires" o "Niort" 
SELECT NOMBRE,CIUDAD FROM DOCENTE
WHERE CIUDAD IN ('Buenos Aires','Niort');

SELECT NOMBRE,CIUDAD FROM DOCENTE
WHERE CIUDAD NOT IN ('Buenos Aires','Niort');

#Obtener los nombres de las materias que son dictadas por algún docente utilizando EXISTS.
SELECT NOMBRE  
FROM MATERIA m
WHERE EXISTS (
	SELECT *
    FROM DICTA d
    WHERE m.CODIGO = d.CODIGO
    );
#Obtener los nombres de los alumnos que están cursando materias utilizando INNER JOIN.
SELECT a.NOMBRE,a.LEGAJO FROM ALUMNO a
INNER JOIN CURSA c on a.LEGAJO = c.LEGAJO;

SELECT a.nombre,a.LEGAJO FROM ALUMNO a
INNER JOIN CURSA c ON a.LEGAJO =c.LEGAJO
WHERE NOTA BETWEEN 7 AND 9;

#Listar las materias que no están siendo dictadas por ningún docente utilizando NOT EXISTS.
SELECT m.NOMBRE
FROM MATERIA m
WHERE NOT EXISTS (
	SELECT *
    FROM DICTA d
    WHERE d.CODIGO = m.CODIGO
    );
#Obtener los nombres de los docentes que están dictando la materia "Historia" utilizando INNER JOIN.
SELECT d.NOMBRE , d.LEGAJO FROM DOCENTE d
INNER JOIN DICTA dt ON d.LEGAJO = dt.LEGAJO
INNER JOIN MATERIA m ON m.CODIGO = dt.CODIGO
WHERE m.NOMBRE = "Historia";

#Listar los alumnos que cursan alguna materia dictada por el docente "Manuel Belgrano" utilizando INNER JOIN.

SELECT a.NOMBRE,a.LEGAJO FROM ALUMNO a
INNER JOIN CURSA c ON a.LEGAJO = C.LEGAJO
INNER JOIN DICTA d ON c.CODIGO = d.CODIGO
INNER JOIN DOCENTE dc ON d.LEGAJO = dc.LEGAJO
WHERE dc.NOMBRE = "Manuel Belgrano";

#Obtener los nombres de las materias que no están siendo cursadas por ningún alumno utilizando NOT EXISTS.
SELECT m.NOMBRE FROM MATERIA m
WHERE NOT EXISTS (
	SELECT *
    FROM CURSA c
    WHERE c.CODIGO = m.CODIGO
);
##Obtener los nombres de los alumnos que cursan alguna materia dictada por un docente 
#cuyo nombre contiene la letra 'a' utilizando INNER JOIN y LIKE
SELECT DISTINCT a.NOMBRE FROM ALUMNO a 
INNER JOIN CURSA c on a.LEGAJO = c.LEGAJO
INNER JOIN DICTA dc on c.CODIGO = dc.CODIGO
INNER JOIN DOCENTE d on dc.LEGAJO = d.legajo
where d.NOMBRE LIKE "%a%";

#SELECT NOMBRE  FROM MATERIA m
#WHERE EXISTS (
	#SELECT *
    #FROM DICTA d
    #WHERE m.CODIGO = d.CODIGO
    #);
#Listar los docentes que viven en la misma ciudad que al menos un alumno utilizando EXISTS Y join
SELECT NOMBRE,CIUDAD FROM DOCENTE d
WHERE EXISTS (
	SELECT *
    FROM ALUMNO a 
    WHERE d.CIUDAD = a.CIUDAD);

SELECT d.NOMBRE,d.CIUDAD FROM DOCENTE d
INNER JOIN ALUMNO a ON d.ciudad = a.CIUDAD;
#Listar los nombres de los docentes que NO dictan la materia "Arte" utilizando INNER JOIN .
SELECT DISTINCT d.NOMBRE FROM DOCENTE d 
INNER JOIN DICTA dc ON d.LEGAJO = dc.LEGAJO 
INNER JOIN MATERIA m ON dc.CODIGO = m.CODIGO 
WHERE m.NOMBRE <> 'Arte';
#Listar los nombres de las materias que son cursadas por al menos un alumno utilizando EXISTS.
SELECT NOMBRE,CODIGO FROM MATERIA m
WHERE EXISTS (
	SELECT *
    FROM CURSA c
    WHERE m.CODIGO = c.CODIGO);

#Obtener los datos (docentes y materias) de los docentes 
#que están dictando la materia "Matematica" o "Geografia" utilizando INNER JOIN y IN.
SELECT doc.NOMBRE FROM DOCENTE doc
INNER JOIN DICTA d ON doc.LEGAJO = d.LEGAJO
INNER JOIN MATERIA m ON d.CODIGO = m.CODIGO
WHERE m.NOMBRE IN ("Matematica", "Geografia");

#18 Listar los nombres de los alumnos que NO están cursando la materia "Educacion fisica" utilizando LEFT JOIN y IS NULL.
SELECT DISTINCT ALUMNO.NOMBRE FROM ALUMNO 
LEFT JOIN CURSA ON ALUMNO.LEGAJO = CURSA.LEGAJO 
LEFT JOIN MATERIA ON CURSA.CODIGO = MATERIA.CODIGO 
WHERE MATERIA.NOMBRE IS NULL OR MATERIA.NOMBRE <> 'Educacion fisica';
