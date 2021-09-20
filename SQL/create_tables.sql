-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema videogames
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videogames
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videogames` DEFAULT CHARACTER SET utf8 ;
USE `videogames` ;

-- -----------------------------------------------------
-- Table `videogames`.`videogame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`videogame` (
  `idname` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`idname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videogames`.`platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`platform` (
  `idplatform` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`idplatform`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videogames`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`comments` (
  `idcomments` INT NOT NULL AUTO_INCREMENT,
  `comment` LONGTEXT NULL,
  `videogame_idname` INT NOT NULL,
  PRIMARY KEY (`idcomments`),
  INDEX `fk_comments_videogame_idx` (`videogame_idname` ASC) VISIBLE,
  CONSTRAINT `fk_comments_videogame`
    FOREIGN KEY (`videogame_idname`)
    REFERENCES `videogames`.`videogame` (`idname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videogames`.`videogame_has_platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`videogame_has_platform` (
  `videogame_idname` INT NOT NULL,
  `platform_idplatform` INT NOT NULL,
  PRIMARY KEY (`videogame_idname`, `platform_idplatform`),
  INDEX `fk_videogame_has_platform_platform1_idx` (`platform_idplatform` ASC) VISIBLE,
  INDEX `fk_videogame_has_platform_videogame1_idx` (`videogame_idname` ASC) VISIBLE,
  CONSTRAINT `fk_videogame_has_platform_videogame1`
    FOREIGN KEY (`videogame_idname`)
    REFERENCES `videogames`.`videogame` (`idname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videogame_has_platform_platform1`
    FOREIGN KEY (`platform_idplatform`)
    REFERENCES `videogames`.`platform` (`idplatform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videogames`.`Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`Genres` (
  `idGenres` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(100) NULL,
  PRIMARY KEY (`idGenres`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videogames`.`videogame_has_Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`videogame_has_Genres` (
  `videogame_idname` INT NOT NULL,
  `Genres_idGenres` INT NOT NULL,
  PRIMARY KEY (`videogame_idname`, `Genres_idGenres`),
  INDEX `fk_videogame_has_Genres_Genres1_idx` (`Genres_idGenres` ASC) VISIBLE,
  INDEX `fk_videogame_has_Genres_videogame1_idx` (`videogame_idname` ASC) VISIBLE,
  CONSTRAINT `fk_videogame_has_Genres_videogame1`
    FOREIGN KEY (`videogame_idname`)
    REFERENCES `videogames`.`videogame` (`idname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videogame_has_Genres_Genres1`
    FOREIGN KEY (`Genres_idGenres`)
    REFERENCES `videogames`.`Genres` (`idGenres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
