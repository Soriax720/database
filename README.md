# database
# 📘 Resumen SQL para Parcial

## 🟦 CONSULTAS BÁSICAS
```sql
SELECT columna1, columna2
FROM tabla
WHERE condición;
```

## 🟩 FILTROS (`WHERE`, `IN`, `LIKE`, `BETWEEN`, `IS NULL`, `<>`)
```sql
WHERE NOMBRE LIKE '%a%'          
WHERE CIUDAD IN ('Lobos','Buenos Aires')  
WHERE NOTA BETWEEN 6 AND 10      
WHERE CAMPO IS NULL              
WHERE NOTA <> 10                 
```

## 🟨 FUNCIONES AGREGADAS

| Función     | Qué hace                             |
|------------|---------------------------------------|
| COUNT(*)   | Cuenta registros                      |
| SUM(col)   | Suma total de una columna numérica    |
| AVG(col)   | Promedio                              |
| MAX(col)   | Máximo valor                          |
| MIN(col)   | Mínimo valor                          |

```sql
SELECT AVG(NOTA) FROM CURSA;
SELECT COUNT(*) FROM ALUMNO;
```

## 🟧 `GROUP BY` + `HAVING`
```sql
SELECT CIUDAD, COUNT(*) 
FROM ALUMNO 
GROUP BY CIUDAD
HAVING COUNT(*) >= 2;
```

## 🟥 `ORDER BY`
```sql
ORDER BY NOMBRE ASC
ORDER BY NOTA DESC
```

## 🟪 JOINs

### `INNER JOIN`
```sql
SELECT a.NOMBRE, m.NOMBRE
FROM ALUMNO a
JOIN CURSA c ON a.LEGAJO = c.LEGAJO
JOIN MATERIA m ON c.CODIGO = m.CODIGO;
```

### `LEFT JOIN`
```sql
SELECT a.NOMBRE, c.NOTA
FROM ALUMNO a
LEFT JOIN CURSA c ON a.LEGAJO = c.LEGAJO;
```

## 🟫 CONDICIONES CON `IF()` y `CASE`

### `IF()`
```sql
SELECT NOMBRE, IF(NOTA >= 6, 'Aprobado', 'Desaprobado') AS ESTADO
FROM CURSA;
```

### `CASE`
```sql
SELECT NOMBRE,
  CASE 
    WHEN NOTA >= 9 THEN 'Excelente'
    WHEN NOTA >= 6 THEN 'Aprobado'
    ELSE 'Desaprobado'
  END AS ESTADO
FROM CURSA;
```

### `SUM(IF(...))`
```sql
SELECT CODIGO,
  SUM(IF(NOTA >= 6, 1, 0)) AS Aprobados,
  SUM(IF(NOTA < 6, 1, 0)) AS Desaprobados
FROM CURSA
GROUP BY CODIGO;
```

## 🟩 `EXISTS` y `NOT EXISTS`
```sql
-- Materias dictadas por algún docente
SELECT NOMBRE 
FROM MATERIA m
WHERE EXISTS (
  SELECT * FROM DICTA d
  WHERE d.CODIGO = m.CODIGO
);

-- Materias que no dicta nadie
SELECT NOMBRE 
FROM MATERIA m
WHERE NOT EXISTS (
  SELECT * FROM DICTA d
  WHERE d.CODIGO = m.CODIGO
);
```

## 🟦 `UNION` y `UNION ALL`
```sql
-- Todos los nombres de personas (sin repetir)
SELECT NOMBRE FROM ALUMNO
UNION
SELECT NOMBRE FROM DOCENTE;

-- Con duplicados
SELECT NOMBRE FROM ALUMNO
UNION ALL
SELECT NOMBRE FROM DOCENTE;
```

## 🟨 VISTAS
```sql
CREATE VIEW vista_aprobados AS
SELECT NOMBRE, NOTA FROM CURSA WHERE NOTA >= 6;

-- Usar la vista:
SELECT * FROM vista_aprobados;
```

## 🟥 STORED PROCEDURE
- Definición: bloque de código que se guarda y se ejecuta con un nombre.
```sql
DELIMITER //
CREATE PROCEDURE listar_materias()
BEGIN
  SELECT * FROM MATERIA;
END //
DELIMITER ;

-- Ejecutar:
CALL listar_materias();
```

## 🟪 TRIGGERS
- Definición: acción automática que se ejecuta ante un evento (INSERT, UPDATE, DELETE).

```sql
CREATE TRIGGER log_insert_alumno
AFTER INSERT ON ALUMNO
FOR EACH ROW
BEGIN
  INSERT INTO log (accion) VALUES ('Se insertó un alumno');
END;
```

## 🧠 CONSEJOS FINALES

- ✅ Escribí siempre el `JOIN` con cuidado: clave primaria ↔ clave foránea  
- ✅ Usar `GROUP BY` con funciones como `COUNT`, `AVG`, etc.  
- ✅ Si necesitás filtrar un resultado **después** de agrupar, usá `HAVING`, no `WHERE`.  
- ✅ Recordá que `UNION` requiere misma cantidad de columnas.  
- ✅ `LEFT JOIN` es útil si querés traer todos los datos de una tabla aunque no haya coincidencia.  
- ✅ `EXISTS` / `NOT EXISTS` verifican si existen registros relacionados.
  

---
