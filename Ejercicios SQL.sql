use CoderHouse;

--1) Indicar cuantos cursos y carreras  tiene el �rea de Data. Renombrar la nueva columna como cant_asignaturas. Keywords: Tipo, �rea, Asignaturas.

SELECT 
Tipo, COUNT (Nombre) AS Cant_Asignaturas 
FROM Asignaturas
WHERE Area = 5 
GROUP BY Tipo;



/*2) Se requiere saber cual es el nombre, el documento y el tel�fono de los estudiantes que son profesionales en agronom�a y que 
-- nacieron entre el a�o 1970 y el a�o 2000. Keywords: Estudiantes, Profesi�n, fecha de Nacimiento.*/

SELECT Nombre, Documento,YEAR([Fecha de Nacimiento]) AS A�o_Nacimiento, Telefono
FROM Estudiantes
WHERE Profesion = 6 
AND [Fecha de Nacimiento] BETWEEN '1970-01-01' AND '2000-12-31';
-- Usando keywords
SELECT * FROM Profesiones 
WHERE Profesiones LIKE '%agronom%'    



/* 3) Se requiere un listado de los docentes que ingresaron en el a�o 2021 y concatenar los campos nombre y apellido. 
El resultado debe utilizar un separador: gui�n (-). 
Ejemplo: Elba-Jimenez. Renombrar la nueva columna como Nombres_Apellidos. 
Los resultados de la nueva columna deben estar en may�sculas. Keywords: Staff, Fecha Ingreso, Nombre, Apellido.*/

SELECT
(CONCAT(Nombre,'-', Apellido)) AS Nombres_Apellidos,
YEAR([Fecha Ingreso]) AS A�o_ingreso
FROM Staff
WHERE YEAR([Fecha Ingreso]) = YEAR(GETDATE())




/*4) Indicar la cantidad de encargados de docentes y de tutores. Renombrar la columna como CantEncargados. 
-- Quitar la palabra �Encargado �en cada uno de los registros. */

SELECT 
COUNT (Nombre) AS CantEncargados,
REPLACE (Tipo,'Encargado','') AS Nuevo_Tipo
FROM Encargado
GROUP BY REPLACE (Tipo,'Encargado','')




/* 5) Indicar cual es el precio promedio de las carreras y los cursos por jornada. Renombrar la nueva columna como Promedio.
Ordenar los promedios de Mayor a menor Keywords: Tipo, Jornada, Asignaturas. */

SELECT * FROM Asignaturas


/* 8) Se requiere conocer el documento, el domicilio el c�digo postal y el nombre de los primeros estudiantes que se registraron en la plataforma.
Keywords: Documento, Estudiantes, Fecha Ingreso.*/

SELECT 
Documento,
[Codigo Postal],
Domicilio,
[Fecha Ingreso],
Nombre
FROM Estudiantes
WHERE [Fecha Ingreso] = (SELECT(MIN([Fecha Ingreso])) FROM Estudiantes);

/* 10) *Se desea calcular el 25% de aumento para las asignaturas del �rea de marketing de la jornada ma�ana. 
Para ello, se deben traer todos los campos, m�s el de los c�lculos correspondientes al porcentaje y al Nuevo costo, ambos deben estar en decimal con 3 d�gitos. 
Renombrar el c�lculo del porcentaje con el nombre porcentaje y la suma del costo m�s el porcentaje por NuevoCosto. Keywords: Asignaturas, Costo, �rea, Jornada, Nombre
*/

SELECT *,
CAST((Costo * 0.25) AS decimal (5,3)) AS Porcentaje_Aumento,
CAST((Costo * 1.25) AS decimal (5,3)) AS Nuevo_Costo,
Costo + Costo * 0.25 AS Nuevo_Costo2

FROM Asignaturas
WHERE Jornada = 'Manana' AND Area =2;

--Consulta de un campo usando una keyword
SELECT Nombre, Area FROM Asignaturas WHERE Nombre LIKE '%Mark%'

