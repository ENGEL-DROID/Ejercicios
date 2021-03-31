DROP DATABASE IF EXISTS autos;
CREATE DATABASE autos CHARACTER SET utf8mb4;
USE autos;

CREATE TABLE coches (
  matricula VARCHAR(10) NOT NULL,
  marca VARCHAR(30) NOT NULL,
  modelo VARCHAR(20) NOT NULL,
  emisiones VARCHAR(20) DEFAULT NULL,
  consumo VARCHAR(120) NOT NULL,
  PRIMARY KEY (matricula)
)ENGINE=INNODB;

-- Datos
INSERT INTO coches VALUES ('V2360OX','Opel','Corsa 1.2 Sport','140','6');
INSERT INTO coches VALUES ('V1010PB','Ford','Probe 2.0 16V','170','5');
INSERT INTO coches VALUES ('V4578OB','Ford','Orion 1.8 Ghia','151','5');
INSERT INTO coches VALUES ('V7648OU','Citroen','Xantia 16V','165','6');
INSERT INTO coches VALUES ('V3543NC','Ford','Escort 1.6 Ghia','150','4');
INSERT INTO coches VALUES ('V7632NX','Citroen','Zx Turbo-D','155','3');
INSERT INTO coches VALUES ('V8018LJ','Ford','Fiesta 1.4 CLX','180','6');