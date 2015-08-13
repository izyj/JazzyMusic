-- MySQL Script generated by MySQL Workbench
-- 08/11/15 23:16:07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Jazzymusic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Jazzymusic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Jazzymusic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Jazzymusic` ;

-- -----------------------------------------------------
-- Table `Jazzymusic`.`artiste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`artiste` (
  `art_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `art_nom` VARCHAR(45) NOT NULL COMMENT '',
  `art_prenom` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`art_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`genre` (
  `gen_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `gen_lib` VARCHAR(45) NULL COMMENT '',
  `genrecol` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`gen_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`album` (
  `alb_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `alb_nom` VARCHAR(100) NOT NULL COMMENT '',
  `alb_date_parution` TIMESTAMP(6) NULL COMMENT '',
  `alb_genre_id` INT NULL COMMENT '',
  PRIMARY KEY (`alb_id`)  COMMENT '',
  INDEX `alb_genre_id_idx` (`alb_genre_id` ASC)  COMMENT '',
  CONSTRAINT `alb_genre_id`
    FOREIGN KEY (`alb_genre_id`)
    REFERENCES `Jazzymusic`.`genre` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`chanson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`chanson` (
  `ch_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `ch_titre` VARCHAR(100) NOT NULL COMMENT '',
  `ch_path` VARCHAR(200) NOT NULL COMMENT '',
  `ch_album_id` INT NULL DEFAULT NULL COMMENT '',
  `ch_genre_id` INT NULL COMMENT '',
  PRIMARY KEY (`ch_id`)  COMMENT '',
  INDEX `ch_album_id_idx` (`ch_album_id` ASC)  COMMENT '',
  INDEX `ch_genre_id_idx` (`ch_genre_id` ASC)  COMMENT '',
  CONSTRAINT `ch_album_id`
    FOREIGN KEY (`ch_album_id`)
    REFERENCES `Jazzymusic`.`album` (`alb_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ch_genre_id`
    FOREIGN KEY (`ch_genre_id`)
    REFERENCES `Jazzymusic`.`genre` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`image` (
  `img_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `img_path` VARCHAR(200) NULL COMMENT '',
  PRIMARY KEY (`img_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`personne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`personne` (
  `pers_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `pers_nom` VARCHAR(100) NOT NULL COMMENT '',
  `pers_prenom` VARCHAR(100) NOT NULL COMMENT '',
  `pers_ville` VARCHAR(100) NOT NULL COMMENT '',
  `pers_rue` VARCHAR(100) NOT NULL COMMENT '',
  `pers_voie` VARCHAR(100) NOT NULL COMMENT '',
  `pers_cp` VARCHAR(100) NOT NULL COMMENT '',
  `pers_mail` VARCHAR(100) NOT NULL COMMENT '',
  PRIMARY KEY (`pers_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `role_libelle` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`role_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`creeralbum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`creeralbum` (
  `cra_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `cra_album_id` INT NULL COMMENT '',
  `cra_artiste_id` INT NULL COMMENT '',
  PRIMARY KEY (`cra_id`)  COMMENT '',
  INDEX `cra_album_id_idx` (`cra_album_id` ASC)  COMMENT '',
  CONSTRAINT `cra_album_id`
    FOREIGN KEY (`cra_album_id`)
    REFERENCES `Jazzymusic`.`album` (`alb_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cra_artiste_id`
    FOREIGN KEY (`cra_id`)
    REFERENCES `Jazzymusic`.`artiste` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`albumimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`albumimage` (
  `albimg_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `albimg_album_id` INT NULL COMMENT '',
  `albimg_image_id` INT NULL COMMENT '',
  PRIMARY KEY (`albimg_id`)  COMMENT '',
  INDEX `ALBIMG_ALBUM_ID_idx` (`albimg_album_id` ASC)  COMMENT '',
  INDEX `ALBIMG_IMAGE_ID_idx` (`albimg_image_id` ASC)  COMMENT '',
  CONSTRAINT `ALBIMG_ALBUM_ID`
    FOREIGN KEY (`albimg_album_id`)
    REFERENCES `Jazzymusic`.`album` (`alb_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ALBIMG_IMAGE_ID`
    FOREIGN KEY (`albimg_image_id`)
    REFERENCES `Jazzymusic`.`image` (`img_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`chansonimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`chansonimage` (
  `chsimg_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `chsimg_chanson_id` INT NULL COMMENT '',
  `chsimg_image_id` INT NULL COMMENT '',
  PRIMARY KEY (`chsimg_id`)  COMMENT '',
  INDEX `chsimg_chanson_id_idx` (`chsimg_chanson_id` ASC)  COMMENT '',
  INDEX `chsimg_image_id_idx` (`chsimg_image_id` ASC)  COMMENT '',
  CONSTRAINT `chsimg_image_id`
    FOREIGN KEY (`chsimg_image_id`)
    REFERENCES `Jazzymusic`.`image` (`img_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chsimg_chanson_id`
    FOREIGN KEY (`chsimg_chanson_id`)
    REFERENCES `Jazzymusic`.`chanson` (`ch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jazzymusic`.`rolepersonne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jazzymusic`.`rolepersonne` (
  `rolepersonne_id` INT NOT NULL COMMENT '',
  `rolepersonne_personne_id` INT NULL COMMENT '',
  `rolepersonne_role_id` INT NULL COMMENT '',
  PRIMARY KEY (`rolepersonne_id`)  COMMENT '',
  INDEX `rolepersonne_personne_id_idx` (`rolepersonne_personne_id` ASC)  COMMENT '',
  INDEX `rolepersonne_role_id_idx` (`rolepersonne_role_id` ASC)  COMMENT '',
  CONSTRAINT `rolepersonne_personne_id`
    FOREIGN KEY (`rolepersonne_personne_id`)
    REFERENCES `Jazzymusic`.`personne` (`pers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rolepersonne_role_id`
    FOREIGN KEY (`rolepersonne_role_id`)
    REFERENCES `Jazzymusic`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;