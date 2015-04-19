INSERT INTO `medic`.`typuslugi`(`id_typ_uslugi`,`nazwa_typu`) VALUES ( NULL,'usługi ogólne'); 
INSERT INTO `medic`.`typuslugi`(`id_typ_uslugi`,`nazwa_typu`) VALUES ( NULL,'usługi specjalistyczne'); 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'badanie ciśnienia','1'); 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'pobranie krwi','1'); 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'porada ginekologiczna','2'); 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'porada ',NULL); 
UPDATE `medic`.`usluga` SET `nazwa_uslugi`='wizyta ginekologiczna' WHERE `id_uslugi`='3'; 
UPDATE `medic`.`usluga` SET `nazwa_uslugi`='wizyta ' WHERE `id_uslugi`='4'; 
UPDATE `medic`.`usluga` SET `nazwa_uslugi`='wizyta u ginekologa' WHERE `id_uslugi`='3'; 
UPDATE `medic`.`usluga` SET `nazwa_uslugi`='wizyta u ortopedy',`id_typ_uslugi`='2' WHERE `id_uslugi`='4'; 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'wizyta u ortodonty','2'); 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'porada ogólna','1'); 
INSERT INTO `medic`.`usluga`(`id_uslugi`,`nazwa_uslugi`,`id_typ_uslugi`) VALUES ( NULL,'wysłanie transportu','1'); 

INSERT INTO `medic`.`placowka`(`id_placowki`,`nazwa_placowki`) VALUES ( NULL,'Gdańsk'); 
INSERT INTO `medic`.`placowka`(`id_placowki`,`nazwa_placowki`) VALUES ( NULL,'Sopot'); 
INSERT INTO `medic`.`placowka`(`id_placowki`,`nazwa_placowki`) VALUES ( NULL,'Gdynia'); 

INSERT INTO `medic`.`lekarz`(`id_lekarza`,`nazwa_lekarza`) VALUES ( NULL,'Jan Kowalski'); 
INSERT INTO `medic`.`lekarz`(`id_lekarza`,`nazwa_lekarza`) VALUES ( NULL,'Janina Kowalska'); 
INSERT INTO `medic`.`lekarz`(`id_lekarza`,`nazwa_lekarza`) VALUES ( NULL,'Aleksandra Ginekolog'); 
UPDATE `medic`.`lekarz` SET `nazwa_lekarza`='Janina Ogólny' WHERE `id_lekarza`='2'; 
UPDATE `medic`.`lekarz` SET `nazwa_lekarza`='Jan Ortopeda' WHERE `id_lekarza`='1'; 
INSERT INTO `medic`.`lekarz`(`id_lekarza`,`nazwa_lekarza`) VALUES ( NULL,'Tadeusz Szef'); 
INSERT INTO `medic`.`lekarz`(`id_lekarza`,`nazwa_lekarza`) VALUES ( NULL,'Olgierd Chirurg'); 
INSERT INTO `medic`.`lekarz`(`id_lekarza`,`nazwa_lekarza`) VALUES ( NULL,'Magda Rejestracja'); 

INSERT INTO `medic`.`stanowisko`(`id_stanowiska`,`nazwa_stanowiska`) VALUES ( '1','Lekarz'); 
INSERT INTO `medic`.`stanowisko`(`id_stanowiska`,`nazwa_stanowiska`) VALUES ( NULL,'Administracja'); 

INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '2','1','1'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '2','2','1'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '2','3','1'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '1','3','1'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '3','3','1'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '3','1','1');
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '5','1','1');
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '5','1','2'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '4','2','2'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '4','2','1');
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '4','3','2');
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '6','1','2'); 
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '6','2','2');
INSERT INTO `medic`.`lekarzplacowka`(`id_lekarza`,`id_placowki`,`id_stanowiska`) VALUES ( '6','3','2'); 

INSERT INTO `medic`.`poradnia`(`id_poradni`,`nazwa_poradni`) VALUES ( NULL,'Ogólna'); 
INSERT INTO `medic`.`poradnia`(`id_poradni`,`nazwa_poradni`) VALUES ( NULL,'Ginekologiczna'); 
INSERT INTO `medic`.`poradnia`(`id_poradni`,`nazwa_poradni`) VALUES ( NULL,'Ortopedyczna'); 
INSERT INTO `medic`.`poradnia`(`id_poradni`,`nazwa_poradni`) VALUES ( NULL,'Chirurgiczna'); 
INSERT INTO `medic`.`lekarzporadnia`(`id_lekarza`,`id_poradni`) VALUES ( '1','3'); 
INSERT INTO `medic`.`lekarzporadnia`(`id_lekarza`,`id_poradni`) VALUES ( '2','1'); 
INSERT INTO `medic`.`lekarzporadnia`(`id_lekarza`,`id_poradni`) VALUES ( '3','2'); 
INSERT INTO `medic`.`lekarzporadnia`(`id_lekarza`,`id_poradni`) VALUES ( '5','4'); 

INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '1','1'); 
INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '1','2'); 
INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '1','3'); 
INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '2',NULL); 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='1' AND `id_placowki`='1'; 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='1' AND `id_placowki`='1'; 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='1' AND `id_placowki`='1'; 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='1' AND `id_placowki`='1'; 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='1' AND `id_placowki`='2'; 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='1' AND `id_placowki`='3'; 
DELETE FROM `medic`.`uslugaplacowka` WHERE `id_uslugi`='2' AND `id_placowki` IS NULL; 
INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '3','1'); 
INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '3','3'); 
INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '4','3'); 

INSERT INTO `medic`.`uslugaporadnia`(`id_uslugi`,`id_poradni`) VALUES ( '1','1'); 
INSERT INTO `medic`.`uslugaporadnia`(`id_uslugi`,`id_poradni`) VALUES ( '2','1'); 
INSERT INTO `medic`.`uslugaporadnia`(`id_uslugi`,`id_poradni`) VALUES ( '3','2'); 
INSERT INTO `medic`.`uslugaporadnia`(`id_uslugi`,`id_poradni`) VALUES ( '4','3'); 
INSERT INTO `medic`.`uslugaporadnia`(`id_uslugi`,`id_poradni`) VALUES ( '6','4'); 
DELETE FROM `medic`.`uslugaporadnia` WHERE `id_uslugi`='6' AND `id_poradni`='4'; 

INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( '2','3'); 
INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( '2','1'); 
INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( '3','3'); 
INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( '1','1'); 
INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( '1',NULL); 
UPDATE `medic`.`poradniaplacowka` SET `id_placowki`='2' WHERE `id_poradni`='1' AND `id_placowki` IS NULL; 
INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( NULL,NULL); 
UPDATE `medic`.`poradniaplacowka` SET `id_poradni`='1',`id_placowki`='3' WHERE `id_poradni` IS NULL AND `id_placowki` IS NULL; 
INSERT INTO `medic`.`poradniaplacowka`(`id_poradni`,`id_placowki`) VALUES ( '4','2');

INSERT INTO `medic`.`uslugaplacowka`(`id_uslugi`,`id_placowki`) VALUES ( '6','2'); 