SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Medic` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `Medic` ;

-- -----------------------------------------------------
-- Table `Medic`.`Placowka`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`Placowka` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`Placowka` (
  `id_placowki` INT(3) NULL AUTO_INCREMENT ,
  `nazwa_placowki` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_placowki`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`Poradnia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`Poradnia` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`Poradnia` (
  `id_poradni` INT(3) NULL AUTO_INCREMENT COMMENT 'id poradni' ,
  `nazwa_poradni` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'nazwa poradni' ,
  PRIMARY KEY (`id_poradni`) ,
  UNIQUE INDEX `un_poradnia` (`id_poradni` ASC, `nazwa_poradni` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`Lekarz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`Lekarz` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`Lekarz` (
  `id_lekarza` INT(3) NULL AUTO_INCREMENT COMMENT 'id lekarza' ,
  `nazwa_lekarza` VARCHAR(255) NOT NULL COMMENT 'nazwa lekarza' ,
  PRIMARY KEY (`id_lekarza`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`Stanowisko`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`Stanowisko` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`Stanowisko` (
  `id_stanowiska` INT(2) NOT NULL AUTO_INCREMENT ,
  `nazwa_stanowiska` VARCHAR(255) NOT NULL COMMENT 'nazwa zajmowanego stanowiska' ,
  PRIMARY KEY (`id_stanowiska`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`LekarzPlacowka`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`LekarzPlacowka` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`LekarzPlacowka` (
  `id_lekarza` INT(3) NULL COMMENT 'id lekarza' ,
  `id_placowki` INT(3) NULL COMMENT 'id placówki' ,
  `id_stanowiska` INT(2) NULL COMMENT 'id stanowiska zajmowanego w placówce' ,
  INDEX `id_lekarza_idx` (`id_lekarza` ASC) ,
  UNIQUE INDEX `un_lekarz_placowka` (`id_lekarza` ASC, `id_placowki` ASC, `id_stanowiska` ASC) ,
  INDEX `fk_lekarzplacowka_placowka_idx` (`id_placowki` ASC) ,
  INDEX `fk_lekarzplacowka_stanowisko_idx` (`id_stanowiska` ASC) ,
  CONSTRAINT `fk_lekarz_lekarzplacowka`
    FOREIGN KEY (`id_lekarza` )
    REFERENCES `Medic`.`Lekarz` (`id_lekarza` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lekarzplacowka_placowka`
    FOREIGN KEY (`id_placowki` )
    REFERENCES `Medic`.`Placowka` (`id_placowki` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lekarzplacowka_stanowisko`
    FOREIGN KEY (`id_stanowiska` )
    REFERENCES `Medic`.`Stanowisko` (`id_stanowiska` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`LekarzPoradnia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`LekarzPoradnia` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`LekarzPoradnia` (
  `id_lekarza` INT(3) NOT NULL COMMENT 'id lekarza' ,
  `id_poradni` INT(3) NOT NULL COMMENT 'id poradni do której przypisany jest lekarz' ,
  INDEX `fk_lekarzporadnia_lekarz_idx` (`id_lekarza` ASC) ,
  INDEX `fk_lekarzporadnia_poradnia_idx` (`id_poradni` ASC) ,
  CONSTRAINT `fk_lekarzporadnia_lekarz`
    FOREIGN KEY (`id_lekarza` )
    REFERENCES `Medic`.`Lekarz` (`id_lekarza` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lekarzporadnia_poradnia`
    FOREIGN KEY (`id_poradni` )
    REFERENCES `Medic`.`Poradnia` (`id_poradni` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`TypUslugi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`TypUslugi` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`TypUslugi` (
  `id_typ_uslugi` INT(3) NULL AUTO_INCREMENT COMMENT 'id typu usługi' ,
  `nazwa_typu` VARCHAR(100) NOT NULL COMMENT 'usługa specjalistyczna / usługa ogólna ' ,
  PRIMARY KEY (`id_typ_uslugi`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`Usluga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`Usluga` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`Usluga` (
  `id_uslugi` INT(3) NULL AUTO_INCREMENT COMMENT 'id usługi' ,
  `nazwa_uslugi` VARCHAR(255) NOT NULL COMMENT 'nazwa świadczonej usługi' ,
  `id_typ_uslugi` INT(1) NULL COMMENT 'id typu usługi' ,
  PRIMARY KEY (`id_uslugi`) ,
  INDEX `fk_usluga_typuslugi_idx` (`id_typ_uslugi` ASC) ,
  CONSTRAINT `fk_usluga_typuslugi`
    FOREIGN KEY (`id_typ_uslugi` )
    REFERENCES `Medic`.`TypUslugi` (`id_typ_uslugi` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`UslugaPlacowka`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`UslugaPlacowka` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`UslugaPlacowka` (
  `id_uslugi` INT(3) NULL COMMENT 'id przypisania usługi' ,
  `id_placowki` INT(3) NULL COMMENT 'przypisanie usługi do placówki' ,
  INDEX `fk_uslugaplacowka_usluga_idx` (`id_uslugi` ASC) ,
  INDEX `fk_uslugaplacowka_placowka_idx` (`id_placowki` ASC) ,
  CONSTRAINT `fk_uslugaplacowka_usluga`
    FOREIGN KEY (`id_uslugi` )
    REFERENCES `Medic`.`Usluga` (`id_uslugi` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_uslugaplacowka_placowka`
    FOREIGN KEY (`id_placowki` )
    REFERENCES `Medic`.`Placowka` (`id_placowki` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`UslugaPoradnia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`UslugaPoradnia` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`UslugaPoradnia` (
  `id_uslugi` INT(3) NULL COMMENT 'id świadczonej usługi' ,
  `id_poradni` INT(3) NULL COMMENT 'id Poradni w której świadoczna jest usługa ' ,
  INDEX `fk_uslugaporadnia_usluga_idx` (`id_uslugi` ASC) ,
  INDEX `fk_usluga_poradnia_poradnia_idx` (`id_poradni` ASC) ,
  CONSTRAINT `fk_uslugaporadnia_usluga`
    FOREIGN KEY (`id_uslugi` )
    REFERENCES `Medic`.`Usluga` (`id_uslugi` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usluga_poradnia_poradnia`
    FOREIGN KEY (`id_poradni` )
    REFERENCES `Medic`.`Poradnia` (`id_poradni` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medic`.`PoradniaPlacowka`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medic`.`PoradniaPlacowka` ;

CREATE  TABLE IF NOT EXISTS `Medic`.`PoradniaPlacowka` (
  `id_poradni` INT(3) NULL COMMENT 'id Poradni' ,
  `id_placowki` INT(3) NULL COMMENT 'id Placówki' ,
  INDEX `fk_poradniaplacowka_poradnia_idx` (`id_poradni` ASC) ,
  INDEX `fk_poradniaplacowka_placowka_idx` (`id_placowki` ASC) ,
  CONSTRAINT `fk_poradniaplacowka_poradnia`
    FOREIGN KEY (`id_poradni` )
    REFERENCES `Medic`.`Poradnia` (`id_poradni` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poradniaplacowka_placowka`
    FOREIGN KEY (`id_placowki` )
    REFERENCES `Medic`.`Placowka` (`id_placowki` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
