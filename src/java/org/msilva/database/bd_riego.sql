create database riego_db;
/*drop database riego_db*/
use riego_db;

create table invernadero(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);

INSERT INTO invernadero VALUES(null);

create table sensorHyT(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);

create table sensorHT(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);

create table valvula(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);

create table historialSensores(
	id INT AUTO_INCREMENT,
	lugar_fk INT,
	sensor1_fk INT,
	field1 float,
	field2 float,
    sensor2_fk INT,
	field3 float,
	fecha datetime,
	PRIMARY KEY(id),
	FOREIGN KEY(lugar_fk) REFERENCES invernadero(id),
    FOREIGN KEY(sensor1_fk) REFERENCES sensorHyT(id),
    FOREIGN KEY(sensor2_fk) REFERENCES sensorHT(id)
);

create table historialRiego(
    id INT AUTO_INCREMENT,
    lugar_fk INT,
    sensor1_fk INT,
    sensor2_fk INT,
    estado bit,
    fecha datetime,
    valvula_fk INT,
    PRIMARY KEY(id),
    FOREIGN KEY(lugar_fk) REFERENCES invernadero(id),
    FOREIGN KEY(sensor1_fk) REFERENCES sensorHyT(id),
    FOREIGN KEY(sensor2_fk) REFERENCES sensorHT(id),
    FOREIGN KEY(valvula_fk) REFERENCES valvula(id)
);