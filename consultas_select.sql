DROP DATABASE IF EXISTS escuela;
#######  CONSULTAS SELECT ###########
create database escuela;
use escuela;
SELECT * FROM MATERIA; #Obtener el nombre de todas las materias
SELECT NOMBRE,CIUDAD FROM ALUMNO; #Obtener el nombre y la ciudad de los alumnos

SELECT NOMBRE,CIUDAD FROM ALUMNO
WHERE CIUDAD LIKE '%A%';##Listar los nombres de los alumnos cuya ciudad posee una letra ‘a’

SELECT NOMBRE,CIUDAD FROM ALUMNO
WHERE CIUDAD = 'Buenos Aires'; #nombre de los alumnos que viven en la ciudad de “Buenos Aires”

SELECT NOMBRE,LEGAJO FROM ALUMNO
WHERE LEGAJO > 2 AND LEGAJO < 5; #alumnos de los cuales su legajo sea mayor a 2 y menor a 5

SELECT NOMBRE , CIUDAD FROM DOCENTE
WHERE NOMBRE LIKE 'J%' AND CIUDAD LIKE 'B%';#Devuelve cuando se cumple 2 condiciones sino se usa or

SELECT NOMBRE,CIUDAD FROM DOCENTE
WHERE CIUDAD IN ('Buenos aires','Yapeyu');#docentes que viven en la ciudad de Buenos Aires y Yapeyu.

SELECT NOMBRE FROM MATERIA 
WHERE SUBSTRING(NOMBRE,4,1) = 't'; #Listar las materias que como cuarta letra poseen una ‘t’

SELECT NOMBRE FROM MATERIA 
WHERE NOMBRE LIKE '%a'; #nombre materias terminen en a

SELECT NOMBRE ,CIUDAD FROM ALUMNO
WHERE CIUDAD != 'Lobos';

SELECT NOMBRE FROM DOCENTE
WHERE NOMBRE NOT LIKE '%i%'; #nombre NO posee la letra ‘i’