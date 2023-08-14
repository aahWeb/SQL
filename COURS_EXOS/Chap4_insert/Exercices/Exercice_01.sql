TRUNCATE `pilots`;
TRUNCATE `companies`;

INSERT INTO `companies` (`comp`, `street`, `city`, `name`, `num_street`, `status`) VALUES
    ('AUS', 'sydney', 'Australie', 'AUSTRA Air', 19, 'draft'),
    ('CHI', 'chi', 'Chine', 'CHINA Air', NULL, 'draft'),
    ('FRE1', 'beaubourg', 'France', 'Air France', 17, 'draft'),
    ('FRE2', 'paris', 'France', 'Air Electric', 22, 'draft'),
    ('SIN', 'pasir', 'Singapour', 'SIN A', 15, 'draft');


-- 01 Exercice Ajouter une colonne created

INSERT INTO `pilots`
(`certificate`,`num_flying`,`company` ,`name`)
VALUES
    ('ct-1', 90, 'AUS', 'Alan' ),
    ('ct-12', 190, 'AUS', 'Albert' ),
    ('ct-7', 80, 'CHI', 'Pierre' ),
    ('ct-11', 200, 'AUS', 'Sophie' ),
    ('ct-6', 20, 'FRE1', 'John' ),
    ('ct-10', 90, 'FRE1', 'Tom' ),
    ('ct-100', 200, 'SIN', 'Yi' ),
    ('ct-16', 190, 'SIN', 'Yan' ),
    ('ct-56', 300, 'AUS', 'Benoit' )
    ;

ALTER TABLE pilots 
ADD created DATETIME DEFAULT CURRENT_TIMESTAMP;