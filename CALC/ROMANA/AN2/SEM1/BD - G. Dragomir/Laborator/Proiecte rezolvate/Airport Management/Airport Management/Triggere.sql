#1---------

CREATE TABLE staff_trigger(
ID INT(3) NOT NULL AUTO_INCREMENT,
Nume VARCHAR(20) NOT NULL,
Prenume VARCHAR(20) NOT NULL,
Modificat datetime DEFAULT NULL,
Action VARCHAR(50) DEFAULT NULL,
PRIMARY KEY(ID));

DELIMITER $$

CREATE TRIGGER before_staff_update BEFORE UPDATE ON staff
FOR EACH ROW BEGIN

INSERT INTO staff_trigger
SET Action= 'update',
Nume= OLD.Nume,
Prenume=OLD.Prenume,
Modificat=NOW();
END $$
DELIMITER ;

UPDATE staff
SET Prenume='Andrei'
WHERE Nume='Cazmariu';

SELECT * FROM staff_trigger;


#2-----------

DELIMITER $$

CREATE TRIGGER delete_companie BEFORE DELETE ON companii_aeriene
FOR EACH ROW BEGIN
  DELETE FROM case_vanzare_bilete WHERE idCompanie=OLD.idCompanie;
  
END $$
DELIMITER ;

DELETE FROM companii_aeriene WHERE Denumire = 'Wizz Air';

SELECT * FROM case_vanzare_bilete;


#3-----------

DELIMITER $$

CREATE TRIGGER delete_destinatie BEFORE DELETE ON destinatii 
FOR EACH ROW BEGIN
  DELETE FROM companii_aeriene WHERE idDestinatii=OLD.idDestinatii;

END $$
DELIMITER ;

DELETE FROM destinatii WHERE Destinatie = 'Larnaca';

SELECT * FROM companii_aeriene;





