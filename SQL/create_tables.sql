-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `score` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4098
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `videogames`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` LONGTEXT NULL DEFAULT NULL,
  `videogame_idname` INT NOT NULL,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_videogame_idx` (`videogame_idname` ASC) VISIBLE,
  CONSTRAINT `fk_comments_videogame`
    FOREIGN KEY (`videogame_idname`)
    REFERENCES `videogames`.`videogame` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 283963
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `videogames`.`platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`platform` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `videogames`.`videogame_has_platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogames`.`videogame_has_platform` (
  `videogame_idname` INT NOT NULL,
  `platform_idplatform` INT NOT NULL,
  PRIMARY KEY (`videogame_idname`, `platform_idplatform`),
  INDEX `fk_videogame_has_platform_platform1_idx` (`platform_idplatform` ASC) VISIBLE,
  INDEX `fk_videogame_has_platform_videogame1_idx` (`videogame_idname` ASC) VISIBLE,
  CONSTRAINT `fk_videogame_has_platform_platform1`
    FOREIGN KEY (`platform_idplatform`)
    REFERENCES `videogames`.`platform` (`id`),
  CONSTRAINT `fk_videogame_has_platform_videogame1`
    FOREIGN KEY (`videogame_idname`)
    REFERENCES `videogames`.`videogame` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
