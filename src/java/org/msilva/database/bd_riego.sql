create database riego_db;
/*drop database riego_db*/
use riego_db;

create table invernadero(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);
INSERT INTO invernadero VALUES(null);
select * from invernadero;

create table sensorHyT(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);
INSERT INTO sensorHyT VALUES(null);
select * from sensorHyT;

create table sensorHT(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);
INSERT INTO sensorHT VALUES(null);
select * from sensorHT;

create table valvula(
    id INT AUTO_INCREMENT,
    PRIMARY KEY(id)
);
INSERT INTO valvula VALUES(null);
select * from valvula;

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
select * from historialSensores;

create table historialRiego(
    id INT AUTO_INCREMENT,
    lugar_fk INT,
    estado bit,
    fecha datetime,
    valvula_fk INT,
    PRIMARY KEY(id),
    FOREIGN KEY(lugar_fk) REFERENCES invernadero(id),
    FOREIGN KEY(valvula_fk) REFERENCES valvula(id)
);
select * from historialRiego;



DELIMITER$$
CREATE PROCEDURE setEstadoRiego(IN _idInvernadero INT,IN _idValvula INT,IN estado BIT ) /* DROP PROCEDURE setEstadoRiego*/
BEGIN
    INSERT INTO historialRiego VALUES(null, _idInvernadero, estado, NOW(), _idValvula );
END$$
DELIMITER ;

DELIMITER$$
CREATE PROCEDURE setHistorialSensores(IN _idInvernadero INT,IN _idSensor1 INT, IN field1/*temperatura*/ FLOAT,IN field2/*humedad*/ FLOAT, IN _idSensor2 INT, IN field3/*humedadT*/ FLOAT) /* DROP PROCEDURE setHistorialSensores*/
BEGIN
    INSERT INTO historialSensores VALUES(null, _idInvernadero, _idSensor1, field1, field2, _idSensor2, field3, NOW());
END$$
DELIMITER ;


CALL setEstadoRiego(1, 1, 0);
CALL setEstadoRiego(2, 1, 1);
CALL setHistorialSensores(1, 1, 38.2, 29.3, 1, 50);
CALL setHistorialSensores(2, 2, 60.2, 43.3, 2, 80);


/*------------------------------------------------------------------------*/

select * from estadoRiego;
select * from verInvernaderos;
select * from verRiegoInvernadero;


CREATE VIEW estadoRiego AS /*drop view estadoRiego*/
SELECT invernadero.id as 'Invernadero Nº', historialRiego.fecha as 'Fecha/Hora', historialRiego.estado as 'Estado Riego'
FROM invernadero, historialRiego
WHERE historialRiego.lugar_fk = invernadero.id;

CREATE VIEW verInvernaderos AS
SELECT invernadero.id as 'Invernadero Nº', historialSensores.field1 as Temperatura, historialSensores.field2 as Humedad, historialSensores.field3 as HumedadTierra, historialSensores.fecha as 'Fecha/Hora'
FROM invernadero, historialSensores 
WHERE historialSensores.lugar_fk = invernadero.id;

CREATE VIEW verRiegoInvernadero AS
SELECT invernadero.id as 'Invernadero Nº', historialSensores.field1 as Temperatura,
historialSensores.field2 as Humedad, historialSensores.field3 as HumedadTierra,
historialSensores.fecha as 'Fecha/Hora de Registro', historialRiego.fecha as 'Fecha/Hora de Riego',
historialRiego.estado as 'Estado Riego'
FROM invernadero, historialSensores, historialRiego
WHERE historialSensores.lugar_fk = invernadero.id AND historialRiego.lugar_fk = invernadero.id;
