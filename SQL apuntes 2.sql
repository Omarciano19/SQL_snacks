
Use world_x;
show tables;
select * from countrylanguage
limit 5;

select * from city where id=129;

## Joins: BD-trabajadores

Create database empresa;
create table empresa.info_trabajadores( 
	id int primary key,
    nombre varchar(50),
    edad int
);
create table empresa.nomina(
	id int primary key,
    salario float,
    id_trabajador int, foreign key (id_trabajador) references info_trabajadores(ID)
);##No se puede hacer referencia de una base de datos a otra.

create table empresa.bonos(
	id int primary key,
    bonos varchar(50),
    id_trabajador int,
    foreign key (id_trabajador) references empresa.info_trabajadores(id)
);
create table empresa.info_bonos(
	id int primary key,
    bonos float,
    id_trabajador int, foreign key (id_trabajador) references empresa.info_trabajadores(id)
    );
insert into empresa.info_trabajadores(id,nombre,edad)
values (1,"alejandro arroyo", 29),
	(2,"benito herrera",34),
    (3,"carlos contreras",30);

insert into empresa.bonos(id, bonos, id_trabajador)
	values (1,"puntualidad",3),
    (2,"puntualidad",1),
    (3,"deportes",1);
    
insert into empresa.info_bonos(id,bonos,id_trabajador)
	values(1,2000,3),
	(2,25000,1),
    (3,18000,2);

/*Joins:
el inner join junta los valores que coinciden en ambas tablas
el left join junta los valores que esten en la talba "izquierda" o tabla 1 con referencias d
	de la segunda, pero pone N/A a aquellos valores que no tengan coincidencia
el rigth join hace lo mismo pero conservando los valores de la derecha
el outer join o full join, no disponible en mysql, todos los valores

Select tabla1.col1,...,tabla1.colN, tabla2.col1,...,tabla2.colN
from tabla1
inner (left,right) join tabla2
on tabla1.col_Join = tabla2.col_join;

funcionan con mas de 2 tablas
*/

select empresa.info_trabajadores.nombre,empresa.bonos.bonos
from empresa.info_trabajadores
inner join empresa.bonos
on empresa.info_trabajadores.id = empresa.bonos.id_trabajador;
use empresa;
show tables;

select empresa.bonos.id_trabajador, empresa.bonos.bonos, empresa.info_bonos.m
from empresa.bonos
inner join empresa.bonos
on empresa.bonos.bonos = empresa.bonos.bono
inner join empresa.info_trabajadores
on empresa.bonos.id_trabajador = empresa.info_trabajadores.id;


/*ejercicio
usando world_X
1 realiza una consulta que te devuelva el nombre del pais y el nombre de su capital
2. realiza una consulta que te devuelva el nombre de todos los paises que inicien con la 
letra de tu nombre y el nombre de su capital.
*/
use world_x;
select * from city;
select * from country;
select country.name, city.name  from country
inner join city
on country.capital = city.id;
#Respuesta de edgar
select 
c.name pais, cap.name capital 
from country c 
left join city cap on c.capital = cap.id;
#Aplicar un where a un join
select country.name, city.name  from country
inner join city
on country.capital = city.id
where country.name like "O%";

/*Subconsultas
son consultas anidadas en una consulta principal,
nos sirven para varias cosas
	-obtener calculos
	-realizar filtros
    -hacer joins mas especificos
    -hacer agrupaciones sobre un grupo especifico
*/

select max(rating) as rating_maximo from libros.libros_full;
select * from libros.libros_full
where rating = rating_maximo;

##Consulta anidada
Select * from libros.libros_full
where rating = (select max(rating) from libros.libros_full);

#Mayor cantidad de reviews
Select * from libros.libros_full
where reviews = (select max(reviews) from libros.libros_full);

#Libros con menor precio
Select * from libros.libros_full
where precio = (select min(precio) from libros.libros_full);

#rating mayor al promedio
Select * from libros.libros_full
where rating > (select avg(rating) from libros.libros_full);

## Añadir eñ sañrop promedio a la tabla nomina
select *, (select avg(empresa.nomina.salario)
		from empresa.nomina) as SALARIO_PROMEDIO
	from empresa.nomina;
    

##Añadir una columna que tenga, para cada año, el rating promedio
select * from libros.libros_full
	inner join (select year, avg(rating) as rating_promedio_anual
	from libros.libros_full
    group by year) as promedio
on libros_full.year = promedio.year;

##Leer hasta lección 5
