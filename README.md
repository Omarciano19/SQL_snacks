# SQL_snacks
Cinco ejercicios de Bases de datos usando SQL, desde creación de una base de datos, consultas basicas y no tan basicas.

Tenemos cinco archivos:
## "crear_bd_libros.sql"
Ejercicio de modelado de bases de datos relacionales; creación de la base de datos "libros", este archivo gestiona la información sobre libros, autores y géneros, y establece relaciones entre estas entidades, aborda: **Normalización de datos**, **Relaciones entre tablas**, **Inserción de datos**.

### Pasos en el codigo:
- -se elimina la base de datos si ya existe
- -se crea la base de datos
- -se crea la tabla principal de libros
    ```
    CREATE TABLE libros.libros_full(
    nombre VARCHAR(1000),
    autor VARCHAR(100),
    rating DECIMAL(5,2),
    reviews INT,
    precio INT,
    year INT,
    genero VARCHAR(25));
    ```
- y se consultan
- -Se insertan varios registros con libros populares, sus autores, calificaciones, reseñas, precios, año de publicación y género.
```
("A Dance with Dragons (A Song of Ice and Fire)", "George R. R. Martin", 4.4, 12643, 11, 2011, "Fiction"),
("A Gentleman in Moscow: A Novel", "Amor Towles", 4.7, 19699, 15, 2017, "Fiction")
```
- -Se crea la tabla de catálogo de géneros, la de autores y de libros, cada una con su nombre y llave primaria.
```
CREATE TABLE libros.catalogo_genero(
    id INT PRIMARY KEY,
    genero VARCHAR(20) NOT NULL);
```
- -Se crea la tabla con relaciones
 ``` 
CREATE TABLE libros.libros(
    id INT PRIMARY KEY,
    id_libro INT,
    id_autor INT,
    rating NUMERIC(5,2),
    Reviews INT,
    Price INT,
    Year INT,
    id_genero INT,
    FOREIGN KEY (id_libro) REFERENCES libros.catalogo_libros(id),
    FOREIGN KEY (id_autor) REFERENCES libros.catalogo_autores(id),
    FOREIGN KEY (id_genero) REFERENCES libros.catalogo_genero(id) );
```



## Peliculas.sql
Este archivo SQL define una base de datos de películas, directores y actores, y establece relaciones entre estas entidades, es un ejercicio clásico de modelado de bases de datos relacionales con relaciones muchos a muchos. Específicamente, abarca:
- Diseño de base de datos: Definición de tablas y relaciones.
- Definición de llaves primarias y foráneas.
- Restricciones: Llaves únicas, no nulos, etc.
- Inserción de datos: Cargar registros en las tablas para construir la base de datos con ejemplos de películas, directores y actores.
  
Todo esto a través del siguiente esquema entidad relación:
![Peliculas table](https://github.com/user-attachments/assets/4518b7a1-5209-4948-95b9-310f07847715)

### Pasos en el ejercicio:
- -Crea y usa la base de datos "peliculas"
- -Tablas principales:
  - -Tabla pelicula
  - -Tabla Director
  - -Tabla Actor
- -Tablas relacionales (muchos a muchos)
  - -Tabla PelículaDirector
  - -PelículaActor
- -Inserción de datos

## SQL apuntes 1.sql 

 Ejercicio de manipulación y gestión de bases de datos enfocados a operaciones CRUD.

 ### Temas cubiertos:
- -Creación de tablas.
- -Definición de restricciones (claves primarias, valores por defecto, no nulos).
- -Inserción de datos.
- -Consultas básicas (selección de registros).
- -Modificación de la estructura de tablas y registros.
- -Eliminación de registros.

## SQL apuntes 2.sql
Ejercicio de  gestión bases de datos complejas, consultas sofisticadas que implican la combinación de múltiples tablas y la aplicación de condiciones específicas.

### Temas cubiertos:

- -Visualización de Tablas y Consultas Iniciales
- -Creación de Base de Datos y Tablas: BD de Trabajadores
- -Inserción de Datos
- -Joins entre Tablas
- -Consultas con la Base de Datos
- -Subconsultas
- -Cálculos Promedio en Consultas




## Omar Mancilla Martínez extra SQL HW.sql

Ejercicio práctico de consultas SQL, explora y analiza datos utilizando operaciones básicas como selección, filtrado, agregación y uniones de tablas.

- -Selección de datos: Extraer información relevante desde tablas.
- -Filtrado de registros: Uso de operadores lógicos y patrones (LIKE).
- -Agregación: Uso de funciones como MAX(), MIN(), COUNT().
- -Uniones de tablas: Relacionar datos entre tablas mediante JOIN.
- -Subconsultas: Utilización de subconsultas anidadas para obtener resultados específicos.

