DROP DATABASE IF EXISTS automoviles;
CREATE DATABASE automoviles CHARACTER SET utf8mb4;
USE automoviles;

CREATE TABLE coches (
  matricula VARCHAR(10) NOT NULL,
  marca VARCHAR(30) NOT NULL,
  modelo VARCHAR(20) NOT NULL,
  emisiones VARCHAR(20) DEFAULT NULL,
  consumo VARCHAR(120) NOT NULL,
  PRIMARY KEY (matricula)
)ENGINE=INNODB;

SHOW TABLE coches;

SELECT * FROM coches;