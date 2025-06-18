use escuela;
#######  CONSULTA FUNCIONES ###########
SELECT COUNT(*) FROM ALUMNO
WHERE NOMBRE LIKE "%p%";
#Obtener el máximo y mínimo legajo de los docentes que viven en Buenos Aires y en Yapeyu
SELECT MIN(LEGAJO),MAX(LEGAJO)
FROM DOCENTE
WHERE CIUDAD IN ("Buenos Aires", "Yapeyu");
#Obtener la suma de los códigos de todas las materias que son dictadas
SELECT SUM(CODIGO) FROM DICTA;
#Sumas las notas de la tabla cursa
SELECT SUM(NOTA) FROM CURSA;
#Encontrar la nota mínima obtenida por un alumno
SELECT MIN(NOTA) FROM CURSA;
#Encontrar la nota maxima obtenida por un alumno
SELECT MAX(NOTA) FROM CURSA;
#Contar la cantidad de docentes que su nombre tienen como tercera letra ‘n’
SELECT COUNT(*) FROM DOCENTE
WHERE NOMBRE LIKE "__n";
#Mostrar el promedio de notas que hay en los alumnos de legajo 1, 4, 5
SELECT AVG(NOTA) FROM CURSA
WHERE LEGAJO IN (1,4,5);
#Mostrar el promedio de notas de los alumnos cuyo nombre contiene la letra e
SELECT AVG(NOTA) FROM CURSA c
INNER JOIN ALUMNO a ON c.LEGAJO = a.LEGAJO
WHERE NOMBRE LIKE "%e%";