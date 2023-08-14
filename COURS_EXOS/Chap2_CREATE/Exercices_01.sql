ALTER TABLE `companies`
ADD COLUMN `status` ENUM('published', 'unpublished', 'draft') NOT NULL DEFAULT 'draft';

ALTER TABLE `companies`
ADD COLUMN `num_street` TINYINT UNSIGNED ;

/*

char(X) fixe un nombre d'octets alloués à la mémore lors de la création d'une ligne
varchar(X)  un nombre variable de 0 à X octets alloués à la mémore lors de la création d'une ligne

*/

CREATE TABLE `pilots` (
    `certificate` CHAR(6) NOT NULL,
    `num_flying` DECIMAL(7,1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT `pk_pilots` PRIMARY KEY (`certificate`),
    UNIQUE KEY (`name`)
);

ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (`company`) REFERENCES companies(`comp`);








