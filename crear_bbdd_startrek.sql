CREATE TABLE Actores (
Cod_Actor INTEGER PRIMARY KEY,
Nombre VARCHAR(50), 
Fecha_Nac DATE,
Nacionalidad VARCHAR(20)
)ENGINE=innodb;

CREATE TABLE Personajes ( 
Cod_Pers INTEGER PRIMARY KEY,
Nombre VARCHAR(50),
Raza VARCHAR(20), 
Grad_Mili VARCHAR(20),
Cod_Pers_Sup INTEGER REFERENCES Personajes (Cod_Pers),
Cod_Peli INTEGER,
Cod_Actor INTEGER,
Fecha_Nac DATE,
Ciudad VARCHAR(20),
Nom_Ment VARCHAR(30),
Fech_Grad DATE,
Planeta VARCHAR(50),
F_U_Comb VARCHAR(50),
FOREIGN KEY (Cod_Peli) REFERENCES Peliculas (Cod_Peli),
FOREIGN KEY (Cod_Actor) REFERENCES Actores (Cod_Actor)
)ENGINE=innodb;

CREATE TABLE Peliculas (
Cod_Peli INTEGER PRIMARY KEY,
Titulo VARCHAR(100),
Anio INTEGER,
Director VARCHAR(50),
Cod_Pers INTEGER,
FOREIGN KEY (Cod_Pers) REFERENCES Personajes (Cod_Pers)
)ENGINE=innodb;

CREATE TABLE Capitulos (
Titulo VARCHAR(100),
Orden INTEGER,
Temporada INTEGER,
Fecha_Emision DATE,
PRIMARY KEY (Orden, Temporada)
)ENGINE=innodb;

CREATE TABLE Planetas (
Cod_Pla INTEGER PRIMARY KEY,
Nombre VARCHAR(50),
Galaxia VARCHAR(50)
)ENGINE=innodb;

CREATE TABLE Planetas_Visitados (
Cod_Planeta INTEGER REFERENCES Planetas (Cod_Pla),
Titulo_Cap VARCHAR(100) REFERENCES Capitulos (Titulo),
PRIMARY KEY (Cod_Planeta, Titulo_Cap)
)ENGINE=innodb;

CREATE TABLE Naves (
Cod_Nav INTEGER PRIMARY KEY,
Nombre VARCHAR(50),
Nro_Trip INTEGER
)ENGINE=innodb;

CREATE TABLE Lanzadera (
Nro_Lanz INTEGER,
Cod_Nave INTEGER REFERENCES Naves (Cod_Nav),
Cap_Pers INTEGER,
PRIMARY KEY (Nro_Lanz, Cod_Nave)
)ENGINE=innodb;

CREATE TABLE Visitas (
Temporada INTEGER REFERENCES Capitulos (Temporada),
Orden INTEGER REFERENCES Capitulos (Orden),
Cod_Planeta INTEGER REFERENCES Capitulos (Cod_Pla),
Cod_Nave INTEGER REFERENCES Capitulos (Cod_Nav),
Problema VARCHAR (200),
PRIMARY KEY (Temporada, Orden, Cod_Planeta, Cod_Nave)
)ENGINE=innodb;

CREATE TABLE Participaciones (
Cod_Pers INTEGER REFERENCES Personajes (Cod_Pers),
Temporada INTEGER REFERENCES Capitulos (Temporada),
Orden INTEGER REFERENCES Capitulos (Orden),  
PRIMARY KEY (Cod_Pers, Temporada, Orden)
)ENGINE=innodb;

CREATE TABLE Apariciones (
Cod_Pers INTEGER REFERENCES Personajes (Cod_Pers),
Cod_Peli INTEGER REFERENCES Peliculas (Cod_Peli),
PRIMARY KEY (Cod_Pers, Cod_Peli)
)ENGINE=innodb;
