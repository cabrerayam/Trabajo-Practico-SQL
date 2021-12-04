
/*A � B�sicas*/

/*1) Indicar cu�les son los t�tulos y autores de los libros cuyo tipo sea �no� y sus precios
originales superen los $21.*/

SELECT 
TITULO, 
AUTOR
FROM LIBRO
WHERE TIPO = 'NO' AND PRECIO_ORI > 21;

/*2) �Cu�les son los n�meros, precios originales y ediciones de los libros cuyo tipo sea �no�
o que sus precios originales superen $21 y las ediciones sean posteriores a 1985? */

SELECT 
NRO_LIBRO,
PRECIO_ORI,
EDICION 
FROM LIBRO
WHERE TIPO = 'NO' AND PRECIO_ORI > 21 AND  EDICION < 1985;

/*3)Obtener la lista autores y ediciones de los libros cuyos nombres de autores comiencen
con la letra L */

SELECT 
AUTOR,
EDICION
FROM LIBRO 
WHERE AUTOR LIKE 'L%';

/*4.Obtener la lista de autores y ediciones de los libros cuyos nombres de autores no
comiencen con la letra G. */

SELECT 
AUTOR,
EDICION
FROM LIBRO 
WHERE AUTOR NOT LIKE 'G%';

/*5)Obtener la lista de autores, precios originales y ediciones de los libros cuyos autores
tengan la hilera "RR" en alg�n lugar del nombre */

SELECT 
AUTOR,
PRECIO_ORI,
EDICION
FROM LIBRO 
WHERE AUTOR LIKE '%RR%';

/*6)Obtener la lista de t�tulos y ediciones de aquellos libros cuyos precios originales no
est�n comprendidos entre $12 y $25. */

SELECT 
TITULO,
EDICION
FROM LIBRO
WHERE PRECIO_ORI NOT BETWEEN 12 AND 25;

/*7)Obtener todos los tipos y ediciones DISTINTAS(en tipo y Edici�n) de los libros,
ordenado por Edici�n y a�o de edici�n ascendente. */

SELECT DISTINCT
TIPO,
EDICION
FROM LIBRO
ORDER BY EDICION ASC ;

/*8)Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias
de precios para todos los libros clasificado por tipo y por dicha diferencia en forma
ascendente, en ese orden.*/

SELECT
NRO_LIBRO,
EDICION,
TIPO, 
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO
ORDER BY TIPO  ASC , DIFERENCIA_PRECIO ASC;

/*9) Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias 
de precios para todos los libros de estudio. */

SELECT
NRO_LIBRO,
EDICION,
TIPO, 
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO;

/*10) �Cu�les son los n�meros, precios originales y ediciones de los libros cuyas ediciones 
son posteriores a 1985 y adem�s o bien el tipo es �no� o el precio original supera $21? */

SELECT
NRO_LIBRO,
PRECIO_ORI,
EDICION
FROM LIBRO
WHERE (EDICION > 1985) AND (TIPO = 'no' OR PRECIO_ORI > 21);

/*11)�Cu�les son los t�tulos y nombres de los autores de los libros cuyo tipo sea �no� o 
aquellos cuyos precios de origen superan $21? */

SELECT 
TITULO,
AUTOR
FROM LIBRO 
WHERE TIPO = 'no' OR PRECIO_ORI > 21;

/*12. Obtener la lista de t�tulos y precios originales de los libros que se editaron en 1948, 
1978 y 1985 */

SELECT
TITULO,
PRECIO_ORI,
EDICION
FROM LIBRO
WHERE EDICION IN (1948,1978,1985);

/*13. Obtener los t�tulos y ediciones de los libros cuyos precios originales est�n dentro del 
rango de $12 a $25 inclusive */

SELECT 
TITULO,
EDICION
FROM LIBRO
WHERE PRECIO_ORI BETWEEN 12 AND 25;

/*14. Obtener la lista de t�tulos, precios originales y ediciones de aquellos libros cuyos t�tulos 
tengan las letras "R" y "S" en alg�n lugar y en ese orden. */

SELECT
TITULO,
PRECIO_ORI,
EDICION
FROM LIBRO 
WHERE TITULO LIKE '%R%' AND TITULO LIKE  '%S%' ; -- REVISAR 

/*15. Obtener la lista de t�tulos, precios originales y ediciones de aquellos libros que tengan 
la letra "A" en la segunda posici�n del t�tulo. */

SELECT
TITULO,
PRECIO_ORI,
EDICION
FROM LIBRO 
WHERE TITULO LIKE '_A%' ;

/*16. Ordenar en secuencia ascendente por a�o de edici�n los t�tulos de los libros cuyo tipo 
sea �no�. Listar tambi�n la edici�n. */

SELECT
TITULO,
EDICION,
FROM LIBRO
WHERE TIPO LIKE 'no'
ORDER BY EDICION ASC;

/*17. Listar los n�meros, ediciones y tipos de libros cuyos precios originales superen los $20. 
Clasificar por edici�n en forma descendente y por n�mero de libro ascendente en ese 
orden. */

SELECT
NRO_LIBRO,
EDICION,
TIPO
FROM LIBRO
WHERE PRECIO_ORI > 20
ORDER BY EDICION DESC, NRO_LIBRO ASC;

/*18. Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias 
de precios para todos los libros cuyas diferencias de precio sean superiores a $10. */

SELECT
NRO_LIBRO,
EDICION,
TIPO,
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10;

/*19. Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias 
de precios para todos los libros cuyas diferencias de precio sean superiores a $10, 
clasificado por dicha diferencia en forma descendente. */

SELECT
NRO_LIBRO,
EDICION,
TIPO,
PRECIO_ORI,
PRECIO_ACT,
PRECIO_ACT - PRECIO_ORI AS DIFERENCIA_PRECIO
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10
ORDER BY (PRECIO_ACT - PRECIO_ORI) DESC;


/*B - Funciones de Agregaci�n, Having */


/*1) Obtener la suma y el promedio de los precios originales y el m�nimo y el m�ximo de los 
precios actuales para todos los libros cuyo a�o de edici�n sea mayor a 1970*/

SELECT
SUM (PRECIO_ORI) AS SUMA_PRECIO_ORI,
AVG (PRECIO_ORI) AS AVG_PRECIO_ORI,
MIN(PRECIO_ACT) AS PRECIO_ACT_MINIMO,
MAX(PRECIO_ACT) AS PRECIO_ACT_MAX
FROM LIBRO
WHERE EDICION > 1970 ;

/*2. Obtener de la suma total de la suma de los precios originales m�s los actuales, el 
promedio de dicha suma y el m�nimo y el m�ximo de las diferencias de precios para 
todos los libros cuyo a�o de edici�n sea superior a 1970. */

SELECT
SUM ((PRECIO_ORI + PRECIO_ACT)) AS SUMA_TOTAL_PRECIOS,
AVG ((PRECIO_ORI) + (PRECIO_ACT)) AS AVG_TOTAL_PRECIOS,
MIN ((PRECIO_ACT - PRECIO_ORI)) AS MINIMO_DIFERENCIA,
MAX ((PRECIO_ACT - PRECIO_ORI)) AS MAXIMO_DIFERENCIA
FROM LIBRO
WHERE EDICION > 1970 ;


/*3. Listar la cantidad de libros, los distintos tipos de libros, el m�nimo y el m�ximo del 
precio original, pero s�lo para aquellos libros cuyo precio original supere los $45.*/

SELECT
COUNT(NRO_LIBRO) AS CANTIDAD_LIBROS,
COUNT(DISTINCT(TIPO)) AS CANTIDAD_TIPO_LIBRO,
MIN(PRECIO_ORI) AS PRECIO_MINIMO,
MAX(PRECIO_ORI) AS PRECIO_MAXIMO
FROM LIBRO
WHERE PRECIO_ORI > 45 ;

/*4. Listar los tipos de libros, totales de precios originales, promedios de precios actuales, 
resumidos por tipo de libro y para los libros cuyas ediciones no sean de 1946, pero s�lo 
para aquellos tipos de libros cuya sumatoria de precios originales supere $40. */

SELECT
TIPO,
SUM (PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG (PRECIO_ACT) AS AVG_PRECIO_ACT
FROM LIBRO 
WHERE EDICION != 1946
GROUP BY TIPO 
HAVING SUM(PRECIO_ORI) > 40 ;

/*5. Listar los tipos de libros y promedios de precios originales agrupados por tipos, para 
aquellos tipos que tengan el promedio de sus precios originales por arriba del 
promedio de precios originales de todos los libros. */

SELECT
TIPO,
AVG(PRECIO_ORI) AS AVG_PRECIOS_ORI
FROM LIBRO
GROUP BY TIPO ;

/*6. Listar los tipos de libros, totales de precios originales y promedios de precios actuales, 
de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro. */

SELECT 
TIPO,
SUM(PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG(PRECIO_ACT) AS PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO ;

/*7. Listar los tipos de libros, totales de precios originales y promedios de precios actuales, 
de aquellos libros que no fueron editados en 1946, resumidos por tipo de libro 
clasificado por promedio de precios actuales de menor a mayor. */

SELECT
TIPO,
SUM(PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG (PRECIO_ACT) AS PROM_PRECIO_ACT
FROM LIBRO
WHERE NOT EDICION = 1946
GROUP BY TIPO
ORDER BY PROM_PRECIO_ACT ASC ;

/*8. Listar los tipos de libros, totales de precios originales y promedios de precios actuales, 
de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro. */

SELECT
TIPO,
SUM(PRECIO_ORI) AS TOTAL_PRECIO_ORI,
AVG (PRECIO_ACT) AS PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO ;

/*9. Listar el salario m�ximo agrupado por el tipo de trabajo.*/

SELECT
TRABAJO,
MAX(SALARIO) AS SALARIO_MAX
FROM LECTOR
GROUP BY TRABAJO ;

/*10. Listar el salario promedio agrupado por tipo de trabajo de los lectores que viven en 
capital.*/

SELECT 
TRABAJO,
DIRECCION,
MAX(SALARIO) AS SALARIO_MAX
FROM LECTOR
WHERE DIRECCION LIKE '%CAPITAL%'
GROUP BY TRABAJO, DIRECCION ;

/*D -- Consultas en varias tablas � uso de join (inner join � left join � right join)  */

/*1. Listar el Titulo, fecha de Pr�stamo y la fecha de Devoluci�n de los Libros prestados*/

SELECT 
TITULO,
F_PREST,
F_DEVOL
FROM LIBRO
INNER JOIN PRESTAMO  ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO ;


/*2. Listar el Nro de Libro, Titulo, fecha de Pr�stamo y la fecha de Devoluci�n de los Libros 
prestados */

SELECT 
LIBRO.NRO_LIBRO,
TITULO,
F_PREST,
F_DEVOL
FROM LIBRO
INNER JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO ;


/*3. Listar el n�mero de lector, su nombre y la cantidad de pr�stamos realizados a ese 
lector. */

SELECT 
LECTOR.NRO_LECTOR,
NOMBRE,
COUNT(PRESTAMO.NRO_LIBRO) AS CANT_PRESTAMOS
FROM LECTOR
INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR
GROUP BY LECTOR.NRO_LECTOR, NOMBRE;

/*4. Listar el n�mero de libro, el t�tulo, el n�mero de copia, y la cantidad de pr�stamos 
realizados para cada copia de cada libro. */

SELECT
LIBRO.NRO_LIBRO,
TITULO,
NRO_COPIA,
COUNT(PRESTAMO.NRO_LIBRO) AS CANT_PRESTAMOS
FROM PRESTAMO
LEFT JOIN LIBRO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
GROUP BY NRO_COPIA, LIBRO.NRO_LIBRO, TITULO ;

/*5. Listar el n�mero de libro, el t�tulo, y la cantidad de pr�stamos realizados para ese libro 
a partir del a�o 2012 */

SELECT
LIBRO.NRO_LIBRO,
TITULO,
COUNT(PRESTAMO.NRO_LIBRO) AS CANT_PRESTAMOS
FROM LIBRO
INNER JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
WHERE PRESTAMO.F_PREST >= 2012
GROUP BY LIBRO.NRO_LIBRO, TITULO ;


/*6. Listar el n�mero de libro, el t�tulo, el n�mero de copia, y la cantidad de pr�stamos 
realizados para cada copia de cada libro, pero s�lo para aquellas copias que se hayan 
prestado m�s de 1 vez. */

SELECT 
LIBRO.NRO_LIBRO,
TITULO,
NRO_COPIA,
COUNT(PRESTAMO.NRO_COPIA) AS CANT_PRESTAMOS_POR_COPIA
FROM LIBRO 
JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
GROUP BY LIBRO.NRO_LIBRO, TITULO, NRO_COPIA
HAVING COUNT(PRESTAMO.NRO_COPIA) > 1 ;

/*7. Listar el Nro de Libro, Titulo, nro de Copia y Fecha de Pr�stamo, de todas las Copias, 
hayan sido prestadas o no */

SELECT
LIBRO.NRO_LIBRO,
TITULO,
COPIAS.NRO_COPIA,
F_PREST
FROM LIBRO
LEFT JOIN COPIAS ON LIBRO.NRO_LIBRO  = COPIAS.NRO_LIBRO
LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO  = PRESTAMO.NRO_LIBRO

/*8. Listar Nro de Lector, Nombre, nro de Libro, Titulo, Descripci�n del Tipo de Libro , fecha 
de pr�stamo que aquellos Prestamos que hayan sido devueltos y el tipo de Libro sea 
Novela o Cuentos */

SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
PRESTAMO.NRO_LIBRO,
TITULO,
DESCTIPO,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
JOIN TIPOLIBRO ON TIPOLIBRO.TIPO = LIBRO.TIPO
WHERE F_DEVOL IS NOT NULL AND DESCTIPO LIKE '%Novela%' OR DESCTIPO LIKE '%Cuentos%'

/*9. Obtener la lista de los t�tulos de los libros prestados y los nombres de los lectores que 
los tienen en pr�stamo */
SELECT
TITULO,
NOMBRE
FROM PRESTAMO
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR

/*10. Listar el Nro de Lector, Nombre y fecha de Pr�stamo de aquellos Lectores que hayan 
realizado un pr�stamo y no lo hayan devuelto */

SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
WHERE F_DEVOL IS NULL

/*11. Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de pr�stamo que aquellos 
Prestamos que hayan sido devueltos */
SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
PRESTAMO.NRO_LIBRO,
TITULO,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
WHERE F_DEVOL IS NOT NULL;

/*12. Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de pr�stamo que aquellos 
Prestamos que hayan sido devueltos y el tipo de Libro sea Novela o Cuentos */
SELECT
PRESTAMO.NRO_LECTOR,
NOMBRE,
PRESTAMO.NRO_LIBRO,
TITULO,
F_PREST
FROM PRESTAMO
JOIN LECTOR ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
JOIN TIPOLIBRO ON LIBRO.TIPO = TIPOLIBRO.TIPO
WHERE F_DEVOL IS NOT NULL AND DESCTIPO LIKE '%Novela%' OR DESCTIPO LIKE '%Cuentos%' ;


/*13. Listar el Nro de Lector, Nombre y fecha de Pr�stamo de Todos los Lectores, hayan 
tenido Prestamos o no*/
SELECT
LECTOR.NRO_LECTOR,
NOMBRE,
F_PREST
FROM LECTOR
FULL OUTER JOIN PRESTAMO ON PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR ;











