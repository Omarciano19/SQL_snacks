##Crear base de datos

/* Crear base de datos
formas de comentar uwu
Ejecutar con el rayito
El punto y coma determina donde termina una sentence
*/

##CREATE DATABASE Aletia;
## Borrar base de datos: DROP DATABASE nombre
##DROP DATABASE Aletia;
##La recreamos, pues se va a usar
##CREATE DATABASE Aletia;
/*crear tablas dentro de la DB: 
	Create TABLE nombre_de_Tabla(
		nombre_col1 tipo_dato,
        nombre_col2 tipo_dato
        nombre_col3 tipo_dato
	)
Nota: primero se debe especificar en que DB se creara:
Use nombre_de_DB
Los tipod de datos son: 
	Varchar(n) : Cadena de texto de longitud variable, se puede definir longitud maxima con n
    char(n) : cadena de texto de longitud n
    Int : crea una columna con valores enteros
    NUMERIC: 
*/
Use Aletia;

Create Table alumnos(
	nombre varchar(50),
    correo varchar(50),
    edad Int,
    fecha_de_nacimiento DATE
    );
    
/*
Asisgnar propiedades y restricciones a las columnas 
PRIMARY KEY -> Especifica que columna es la llave primaria
NOT NULL -> no permite vacios
DEFAULT -> Especifica un valor defaul en caso de no introducirlo
AUTOINCREMENT -> solo para llaves primarias, para cada registri agrega 1
*/
USE ALETIA;
CREATE TABLE Alumnos2(
	id int primary key auto_increment,
    nombre varchar(50) not null,
    correo varchar(50) default 'sin correo'
);
##Tambien se puede crear la tabla sin usar use, esta forma es mas profesional:
CREATE TABLE aletia.mentores(
	id int primary key auto_increment,
    nombre varchar(50) not null,
    correo varchar(50) default 'sin correo'
);
/* Añadir registros a una tabla
## Con codigo:
INSERT INTO nombre_de_tabla(col1,col2,col3,...) notar que aqui no hay punto y coma, es una sola sentencia
VALUES (val1,val2,val3,...)
	   (val21,val22,val23,...)
	   (val31,val32,val33,...)
       ...	   
       (valN1,valN2,valN3,...);
## Desde un CSV
       */
INSERT INTO aletia.alumnos2(nombre, correo)
	VALUES ("Omar Mancilla","omar.physik.mm@gmail.com"),
		  ("Diego A", "diego@ale.ia"),
          ("cristian V", "chris@ale.ia");
INSERT INTO aletia.alumnos(nombre, correo,edad,fecha_de_nacimiento)
	VALUES ("Omar Mancilla","omar.physik.mm@gmail.com",27,"1996-10-22");
/* Consulta de contenido en las tablas
SELECT * From nombre_de_tabla;
	Select indica a sql que haremos una consulta
    * vamos a consultar todas las columnas de una tabla
    FROM Le indica a sql que vamos a hacer la conslta en una tabla en especifico
    nombre de tabla indica la tabla a tratar
*/

Select * from aletia.alumnos;
select * from aletia.alumnos2;

       
/*Clausulas para e4xplorar base de datos/tablas
DESCRIBE nombre_tabla; ver las columnas y atributos de una tabla*/
Describe aletia.alumnos2;

USE ALETIA;
Show Tables;
/* Alterar registros existentes:
       UPDATE nombre_tabla -> modificar registros en una tabla
       set nuevo valor -> especificar nuevo valo
       where condicion; -> especificar registros a cambiar */
Update aletia.alumnos2
	set correo = 'marco@aletia.com'
	where nombre="diego A";
##manda un error debido al modo seguro habilitado, debe haber un WHERE señalando a una LLAVE PRIMARIA
##SET SQL_SAFE_UPDATES=0 1	desabilitar o habilitar el modo seguro, no se recomienda deshabilitarlo
       
/* Eliminar registros: 
DELET FROM nombre_tabla ->de que tabla?
WHERE condicion; -> condición para ser borrado
*/
DELETE From aletia.alumnos2
where id=3;
##otra opcion Where nombre LIKE %C%; eliminara todos aquellos que inicien con C.

/* Modificar tablas: 
ALTER TABLE nombre_tabla -> modificar las propiedades de una tabla
ADD nombre_col tipo de dato -> añade una nueva columna de cierto tipo
drop column nombre_col -> Elimina una col
Modify nombre_col tipo_dato atributo_extra-> añade atributos a una columna exitente
*/
Describe aletia.alumnos;

Alter Table aletia.alumnos
add id int primary key auto_increment not null;

Alter Table aletia.alumnos
modify nombre varchar(35) not null;

Alter Table aletia.alumnos
Modify correo varchar(25) default "desconocido";

Describe aletia.alumnos;
/*Crear una tabla con llaves foraneas
create table nombre_tabla(
	col1 int primary key,
    col2 int not null
    foreing key (col2) REFERENCES tabla2(LLAVE_PRIMARIA)
);
*/
use aletia;
show tables;
Describe aletia.mentor;

Create table cursos(id int primary key, ##Identificador del curso (llave primaria)
	nombre_curso varchar(50) not null, #Caracter con el nombre del curso
    id_mentor int,
    FOREIGN KEY (id_mentor) REFERENCES mentores(id) #ID del mentor que imparte el curso
    );
Describe aletia.cursos
/* TAREA 1:
1- Crear una base de datos que se llame peliculas
detalles en tarea final de classroom
agregar los atributos y tipo de dato de cada columna de cada tabla
se entrega el script
comentar trabajo 
extra: insertar valores
*/

