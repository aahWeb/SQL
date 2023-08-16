

SELECT DATE_FORMAT( ( SELECT CURDATE() - INTERVAL 1 YEAR), '%W' ) ;
SELECT DATE_FORMAT( ( SELECT CURDATE() - INTERVAL 1 YEAR), '%Y-%m-%d %H:%i:%s' ) ;
SELECT DATE_FORMAT( ( SELECT CURDATE() - INTERVAL 1 YEAR), '%W, %d, %Y' ) ;

-- Ou bien :
SELECT DATE_FORMAT(DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 YEAR), '%W');

SELECT MAX(`birth_day`) from `pilots`;
SELECT DATE_ADD('2018-05-01', INTERVAL 1 DAY);


-- crée une date aléatoire +/- 3 an(s) à partir de la date de naissance la plus récente dans la table pilots

SELECT DATE_FORMAT (DATE_ADD(
    (SELECT MAX(`birth_day`) from `pilots`), 
    INTERVAL ( SELECT TRUNCATE( RAND() * 3 + 1, 0 ) ) DAY
), '%Y-%m-%d' ) as `date_alea`;