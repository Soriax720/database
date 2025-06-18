############# VISTAS ############


#Crear una vista que muestre el legajo, nombre del alumno, nombre de la materia y nota obtenida.
CREATE VIEW vista_alumno_materia_nota AS
SELECT 
    A.LEGAJO,
    A.NOMBRE AS NOMBRE_ALUMNO,
    M.NOMBRE AS NOMBRE_MATERIA,
    C.NOTA
FROM 
    CURSA C
    JOIN ALUMNO A ON C.LEGAJO = A.LEGAJO
    JOIN MATERIA M ON C.CODIGO = M.CODIGO;

#Crear una vista que liste los docentes junto a las materias que dictan.
CREATE VIEW vista_docente_materia AS
SELECT 
    D.NOMBRE AS NOMBRE_DOCENTE,
    M.NOMBRE AS NOMBRE_MATERIA
FROM 
    DICTA DI
    JOIN DOCENTE D ON DI.LEGAJO = D.LEGAJO
    JOIN MATERIA M ON DI.CODIGO = M.CODIGO;
#Crear una vista que incluya solo las cursadas aprobadas (nota ≥ 6).
CREATE VIEW vista_aprobados AS
SELECT 
    *
FROM 
    CURSA
WHERE 
    NOTA >= 6;
#Crear una vista que muestre el promedio de nota por alumno.
CREATE VIEW vista_promedio_alumno AS
SELECT 
    A.LEGAJO,
    A.NOMBRE,
    AVG(C.NOTA) AS PROMEDIO
FROM 
    ALUMNO A
    JOIN CURSA C ON A.LEGAJO = C.LEGAJO
GROUP BY 
    A.LEGAJO, A.NOMBRE;