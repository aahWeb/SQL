/**

UPDATE companies
SET street = 'Shenton Park',
 city = 'Perth', 
 num_street=20
WHERE comp = 'AUS';

UPDATE companies
SET street = 'Rue de la Lieure',
 city = 'Voiron',
  num_street=11
WHERE comp = 'FRE1';

UPDATE companies
SET street = 'Qinghai',
 city = 'Xian de Tongde',
  num_street=17
WHERE comp = 'CHI';

UPDATE companies
SET street = 'Rue de la Paix',
 city = 'Paris',
  num_street=22
WHERE comp = 'FRE2';

UPDATE companies
SET street = 'Marymount',
 city = 'Singapour',
  num_street=1
WHERE comp = 'SIN';

INSERT INTO `companies`
SET `comp` = 'ITA', 
    `street` = 'mapoli', 
    `city` = 'Rome', 
    `name` = 'Italia Air',
    `num_street` = 20;

*/

/*
01 Calculez la moyenne des heures de vol pour chaque compagnie.
*/

SELECT AVG(num_flying), company FROM pilots
GROUP BY company;


/*

02 Calculez la moyenne des heures de vol des pilotes dont le bonus est de 500,
par compagnie.
*/

SELECT company, AVG(num_flying) FROM pilots
WHERE bonus = 500
GROUP BY company;

/*

03 Sélectionnez les compagnies ayant plus d'un pilote, ainsi que leur nombre de pilotes.

*/
SELECT company, COUNT(certificate) as c
FROM pilots 
GROUP BY company
HAVING c > 1;

/*
04 Nombre de pilotes par compagnie et par nombre d'heure de vol.
*/
SELECT company, num_flying, COUNT(certificate)
FROM pilots 
GROUP BY company, num_flying;

-- Pareil mais par Bonus et pas par nb d'heure de vol
SELECT company, bonus, COUNT(certificate)
FROM pilots 
GROUP BY company, bonus;

/*
05 Exercice ajout d'une colonne
si ce n'est pas déjà fait (dans les exercices)
*/

ALTER TABLE pilots 
ADD COLUMN plane 
ENUM('A380', 'A320', 'A340') AFTER name;

UPDATE pilots
SET plane = 'A380'
WHERE name in ('Alan', 'Sophie', 'Albert', 'Benoit');

UPDATE pilots
SET plane = 'A320'
WHERE name in ('Tom', 'John', 'Yi');

UPDATE pilots
SET plane = 'A340'
WHERE name in ('Yan', 'Pierre');

/*
05 Sélectionnez le nombre de pilotes par compagnie et par type d'avion.
*/

SELECT company, plane, COUNT(certificate)
FROM pilots
GROUP BY company, plane;


/*

06 

- Sélectionnez le noms des pilotes par bonus.

- Sélectionnez le nom et la compagnie des pilotes par bonus.
*/

-- separator par defaut : ","
SELECT bonus, GROUP_CONCAT(name) as pilotes FROM pilots GROUP BY bonus;

-- pas de virgule
SELECT bonus, GROUP_CONCAT(name SEPARATOR ' ') as pilotes  FROM pilots GROUP BY bonus;

-- Avec le code de la compagnie en plus :
SELECT bonus, GROUP_CONCAT( `name`,' ', `company` ) as pilotes
FROM pilots GROUP BY company, bonus;

-- Plus propre :
SELECT bonus, GROUP_CONCAT(`name`,' (', `company`,')' SEPARATOR ', ') as pilotes
FROM pilots GROUP BY company, bonus;

-- Attention vous avez également CONCAT qui permet de concaténer deux colonnes, ce n'est pas une fonction de 
-- regroupement

SELECT CONCAT(name, plane) from pilots;  -- sélectionne toutes les lignes

/*

07 Calculez l'étendue du nombre d'heures de vol par compagnie.

*/

SELECT company, MAX(num_flying) - MIN(num_flying)
FROM pilots GROUP BY company;

/*

08 Faites la somme du nombre de jours de vols par compagnie 
dont la somme est supérieure à 30.

*/

SELECT sum(num_jobs) as sum_jobs, company
FROM pilots GROUP BY company
HAVING sum_jobs > 30;

-- Calculez le nombre de jours de vol par compagnie, supérieur à 30 jours

SELECT ROUND( sum(num_flying) / 24, 1 ) as nbDay, company
FROM pilots GROUP BY company
HAVING nbDay > 30;


/*

Ajoutez une colonne qui détermine le nom du pays en fonction de l'information sur la ville.

09 Afficher la moyenne des heures de vol pour les compagnies dont la ville est en France,
Récupérez le nom de ces villes.
*/

ALTER TABLE `companies` ADD COLUMN `country` CHAR(4) ;

-- il faut regrouper les noms des villes dans la deuxième requête car la première contient uniquement la moyenne des villes en France

( SELECT  AVG(num_flying) FROM `pilots`
WHERE `company`  IN ( SELECT `comp` FROM `companies` WHERE `country` = 'fr' )  )  UNION (
SELECT GROUP_CONCAT(city) FROM `companies` WHERE `country` = 'fr' GROUP BY country )

