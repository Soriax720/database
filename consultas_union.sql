######### UNION #######

#Mostrar los nombres de alumnos y docentes (sin repetir) que viven en Buenos Aires.
SELECT NOMBRE AS NOMBRE_PERSONA FROM ALUMNO 
WHERE CIUDAD = 'Buenos Aires'
UNION
SELECT NOMBRE FROM DOCENTE WHERE CIUDAD = 'Buenos Aires';
#Obtener el nombre y ciudad de alumnos y docentes (incluso si se repiten) que viven en "Buenos Aires" o "Lobos".
SELECT NOMBRE, CIUDAD FROM ALUMNO 
WHERE CIUDAD IN ('Buenos Aires', 'Lobos')
UNION ALL
SELECT NOMBRE, CIUDAD FROM DOCENTE 
WHERE CIUDAD IN ('Buenos Aires', 'Lobos');
#Mostrar el nombre de la persona (alumno o docente) y un tipo que diga si es 'ALUMNO' o 'DOCENTE'.
SELECT NOMBRE, 'ALUMNO' AS TIPO FROM ALUMNO
UNION
SELECT NOMBRE, 'DOCENTE' FROM DOCENTE;
#Mostrar el nombre y ciudad de personas que viven en ciudades donde hay al menos un alumno y un docente.
SELECT NOMBRE, CIUDAD FROM ALUMNO 
WHERE CIUDAD IN (SELECT CIUDAD FROM DOCENTE)
UNION
SELECT NOMBRE, CIUDAD FROM DOCENTE 
WHERE CIUDAD IN (SELECT CIUDAD FROM ALUMNO);
