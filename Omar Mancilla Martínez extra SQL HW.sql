##Omar Mancilla Martínes
## SQL extra HomeWork

Use world;
# ejercicio 1
select ID, name, population from city limit 15;
# ejercicio 2
select* from city where population > 2000000;
# ejercicio 3
select name from city where name like "Be%";
# ejercicio 3
select* from city where population > 500000 and Population < 1000000;
# ejercicio 4
select * from city order by name asc;
# ejercicio 5
select * from country where population = (select max(population) from country);
# ejercicio 6
SELECT DISTINCT countrylanguage.Language
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE country.Region = 'caribbean';
# ejercicio 7
select city.name from country join city on city.id = country.capital
where country.name= "spain" or country.name="mexico" or country.name like "O%";
# ejercicio 8
select name, LifeExpectancy from country where LifeExpectancy= (select max(LifeExpectancy) from country) or LifeExpectancy=(select min(LifeExpectancy) from country);
# ejercicio 9
select name from country where continent = "Europe";
# ejercicio 10
select name from city where city.name like "o%" order by population asc limit 1;
# ejercicio 11
select count(*) from city where city.name like "o%";
# ejercicio 12
select count(*) from city where city.countrycode= (select code from country where name="china") ; 
# ejercicio 13
SELECT DISTINCT countrylanguage.Language
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE country.Region = 'southeast asia';




