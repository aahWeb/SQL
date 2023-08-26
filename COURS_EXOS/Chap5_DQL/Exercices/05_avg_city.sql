/**

Calculer la moyenne des heures de vols par ville.

Calculer la moyenne des heures de vols par pays.

*/

SELECT c.city, AVG(p.num_flying) as avg_flying
FROM pilots as p
JOIN companies as c
ON p.company = c.comp
GROUP BY c.city ;

SELECT c.country, AVG(p.num_flying) as avg_flying, GROUP_CONCAT(DISTINCT c.city) as city
FROM pilots as p
JOIN companies as c
ON p.company = c.comp
GROUP BY c.country ;