-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Railway_DB_PR
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Railway_DB_PR
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Railway_DB_PR` DEFAULT CHARACTER SET utf8 ;
USE `Railway_DB_PR` ;

-- -----------------------------------------------------
-- Table `Railway_DB_PR`.`Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Railway_DB_PR`.`Station` ;

CREATE TABLE IF NOT EXISTS `Railway_DB_PR`.`Station` (
  `Station_ID` INT NOT NULL,
  `Station_Name` VARCHAR(45) NOT NULL,
  `Station_Type` VARCHAR(45) NOT NULL,
  `Rail_Lines_Served` VARCHAR(45) NOT NULL,
  `Jurisdiction` VARCHAR(45) NULL,
  PRIMARY KEY (`Station_ID`),
  UNIQUE INDEX `Station_ID_UNIQUE` (`Station_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Railway_DB_PR`.`Station_Transit_Scores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Railway_DB_PR`.`Station_Transit_Scores` ;

CREATE TABLE IF NOT EXISTS `Railway_DB_PR`.`Station_Transit_Scores` (
  `Transit_ID` INT NOT NULL,
  `Station_ID` INT NOT NULL,
  `Transit_Score` INT NULL,
  `Station_Facility_Score` INT NULL,
  `Parking_Access_Score` INT NULL,
  `Bike_Access_Score` INT NULL,
  PRIMARY KEY (`Transit_ID`),
  UNIQUE INDEX `Transit_ID_UNIQUE` (`Transit_ID` ASC) VISIBLE,
  UNIQUE INDEX `Station_ID_UNIQUE` (`Station_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Railway_DB_PR`.`Transit Table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Railway_DB_PR`.`Transit Table` ;

CREATE TABLE IF NOT EXISTS `Railway_DB_PR`.`Transit Table` (
  `Transit ID` INT NOT NULL,
  `Transit Connections` VARCHAR(45) NULL,
  `Station_Transit_Scores_Transit_ID` INT NOT NULL,
  PRIMARY KEY (`Transit ID`, `Station_Transit_Scores_Transit_ID`),
  UNIQUE INDEX `Transit ID_UNIQUE` (`Transit ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Railway_DB_PR`.`Station_has_Transit Table2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Railway_DB_PR`.`Station_has_Transit Table2` ;

CREATE TABLE IF NOT EXISTS `Railway_DB_PR`.`Station_has_Transit Table2` (
  `Station_Station_ID` INT NOT NULL,
  `Transit Table_Transit ID` INT NOT NULL,
  PRIMARY KEY (`Station_Station_ID`, `Transit Table_Transit ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Railway_DB_PR`.`Station_has_Transit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Railway_DB_PR`.`Station_has_Transit` ;

CREATE TABLE IF NOT EXISTS `Railway_DB_PR`.`Station_has_Transit` (
  `Station_Station_ID` INT NOT NULL,
  `Transit Table_Transit ID` INT NOT NULL,
  `Connecting_Bus_Routes` VARCHAR(45) NULL,
  PRIMARY KEY (`Station_Station_ID`),
  UNIQUE INDEX `Transit Table_Transit ID_UNIQUE` (`Transit Table_Transit ID` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
