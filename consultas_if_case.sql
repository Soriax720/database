#############IF CASE################


#Mostrar el legajo, nombre y estado del alumno según su nota.
#Detalle: Aprobado si la nota ≥ 6, Desaprobado si la nota < 6, Sin nota si es NULL.
use escuela;
SELECT a.LEGAJO, a.NOMBRE,
CASE 
	WHEN c.NOTA >= 6 THEN "Aprobado"
    WHEN c.NOTA < 6 THEN "Desaprobado"
    WHEN c.NOTA IS NULL THEN "SIN NOTA"
END AS ESTADO
FROM ALUMNO a 
INNER JOIN CURSA c ON a.LEGAJO = c.LEGAJO;
#Indicar si los alumnos son 'Locales' o 'Foráneos' según si viven en Buenos Aires.
SELECT NOMBRE,CIUDAD,
IF(CIUDAD = "Buenos Aires", "Locales", "Foraneos") as son
FROM ALUMNO;
#Para cada materia cursada por alumnos, indicar condición académica.
#Detalle: Promociona directa (nota ≥ 8), Va a final (nota ≥ 6 y < 8), Reprueba (nota < 6).
SELECT 
    M.NOMBRE AS MATERIA,
    A.NOMBRE AS ALUMNO,
    C.NOTA,
    CASE 
        WHEN C.NOTA >= 8 THEN 'Promoción directa'
        WHEN C.NOTA >= 6 THEN 'Final obligatorio'
        ELSE 'Reprobado'
    END AS CONDICION
FROM 
    CURSA C
    JOIN ALUMNO A ON C.LEGAJO = A.LEGAJO
    JOIN MATERIA M ON C.CODIGO = M.CODIGO;
#Contar cuántos alumnos aprobaron y reprobaron por materia.
#Detalle: Usar IF dentro de SUM + GROUP BY.
SELECT 
    M.NOMBRE AS MATERIA,
    SUM(IF(C.NOTA >= 6, 1, 0)) AS APROBADOS,
    SUM(IF(C.NOTA < 6, 1, 0)) AS DESAPROBADOS
FROM 
    CURSA C
    JOIN MATERIA M ON C.CODIGO = M.CODIGO
GROUP BY 
    M.NOMBRE;

#Para cada alumno, mostrar su mejor nota y una evaluación.
#Detalle: Excelente alumno (nota ≥ 9), Buen alumno (nota ≥ 6), Debe mejorar (nota < 6), Sin cursadas (NULL).
SELECT 
    A.NOMBRE,
    MAX(C.NOTA) AS MEJOR_NOTA,
    CASE 
        WHEN MAX(C.NOTA) >= 9 THEN 'Excelente alumno'
        WHEN MAX(C.NOTA) >= 6 THEN 'Buen alumno'
        WHEN MAX(C.NOTA) IS NULL THEN 'Sin cursadas'
        ELSE 'Debe mejorar'
    END AS EVALUACION
FROM 
    ALUMNO A
    LEFT JOIN CURSA C ON A.LEGAJO = C.LEGAJO
GROUP BY 
    A.NOMBRE;

