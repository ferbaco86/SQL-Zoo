SELECT id, title FROM movie WHERE yr=1962;

SELECT yr FROM movie WHERE title = 'Citizen Kane';

SELECT id,title,yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;

SELECT id FROM actor WHERE name = 'Glenn Close';

SELECT id FROM movie WHERE title = 'Casablanca';

SELECT name FROM casting JOIN actor ON actorid=id WHERE movieid = 11768;

SELECT name FROM casting JOIN actor ON actorid=id WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien' );

SELECT title FROM movie JOIN casting ON id=movieid WHERE actorid = (SELECT DISTINCT id FROM actor JOIN casting ON id = actorid WHERE name = 'Harrison Ford');

SELECT title FROM movie JOIN casting ON id=movieid WHERE actorid = (SELECT DISTINCT id FROM actor JOIN casting ON id = actorid WHERE name = 'Harrison Ford') AND ord != 1;

SELECT title, name FROM (actor JOIN casting ON id = actorid) JOIN movie ON movie.id=movieid WHERE ord =1 AND yr = 1962;

SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id WHERE name='Rock Hudson' GROUP BY yr
HAVING COUNT(title) > 2;

SELECT title, name 
FROM movie JOIN casting ON movieid = movie.id AND ord = 1
           JOIN actor ON actor.id = actorid
WHERE movie.id IN 
     (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'));

SELECT name FROM actor JOIN casting ON (actor.id = actorid) WHERE ord = 1 GROUP BY name HAVING COUNT(*)>=15;

SELECT title, COUNT(actorid) FROM (movie JOIN casting ON movieid = movie.id) JOIN actor ON actor.id = actorid WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title;

SELECT name FROM (actor JOIN casting ON actorid = actor.id) JOIN movie ON movieid = movie.id WHERE movieid IN (SELECT movieid FROM  (actor JOIN casting ON actorid = actor.id) JOIN movie ON movieid = movie.id WHERE name = 'Art Garfunkel') AND name != 'Art Garfunkel';