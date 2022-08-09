-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema uodb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `uodb` ;

-- -----------------------------------------------------
-- Schema uodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `uodb` DEFAULT CHARACTER SET utf8 ;
USE `uodb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `run` ;

CREATE TABLE IF NOT EXISTS `run` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_attended` DATETIME NULL,
  `solo` TINYINT NULL,
  `deaths` INT NULL,
  `raided` TINYINT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_champspawn_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_champspawn_user1_idx` ON `run` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `scroll`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scroll` ;

CREATE TABLE IF NOT EXISTS `scroll` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `champspawn_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_scroll_champspawn1`
    FOREIGN KEY (`champspawn_id`)
    REFERENCES `run` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_scroll_champspawn1_idx` ON `scroll` (`champspawn_id` ASC);


-- -----------------------------------------------------
-- Table `artifact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artifact` ;

CREATE TABLE IF NOT EXISTS `artifact` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `quantity` VARCHAR(45) NULL,
  `champspawn_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_artifact_champspawn`
    FOREIGN KEY (`champspawn_id`)
    REFERENCES `run` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_artifact_champspawn_idx` ON `artifact` (`champspawn_id` ASC);


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `value`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `value` ;

CREATE TABLE IF NOT EXISTS `value` (
  `id` INT NOT NULL,
  `point_gain` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scroll_has_value`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scroll_has_value` ;

CREATE TABLE IF NOT EXISTS `scroll_has_value` (
  `scroll_id` INT NOT NULL,
  `value_id` INT NOT NULL,
  PRIMARY KEY (`scroll_id`, `value_id`),
  CONSTRAINT `fk_scroll_has_value_scroll1`
    FOREIGN KEY (`scroll_id`)
    REFERENCES `scroll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scroll_has_value_value1`
    FOREIGN KEY (`value_id`)
    REFERENCES `value` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_scroll_has_value_value1_idx` ON `scroll_has_value` (`value_id` ASC);

CREATE INDEX `fk_scroll_has_value_scroll1_idx` ON `scroll_has_value` (`scroll_id` ASC);


-- -----------------------------------------------------
-- Table `scroll_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scroll_has_category` ;

CREATE TABLE IF NOT EXISTS `scroll_has_category` (
  `scroll_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`scroll_id`, `category_id`),
  CONSTRAINT `fk_scroll_has_category_scroll1`
    FOREIGN KEY (`scroll_id`)
    REFERENCES `scroll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scroll_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_scroll_has_category_category1_idx` ON `scroll_has_category` (`category_id` ASC);

CREATE INDEX `fk_scroll_has_category_scroll1_idx` ON `scroll_has_category` (`scroll_id` ASC);


-- -----------------------------------------------------
-- Table `champspawn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champspawn` ;

CREATE TABLE IF NOT EXISTS `champspawn` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_has_champspawn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `run_has_champspawn` ;

CREATE TABLE IF NOT EXISTS `run_has_champspawn` (
  `run_id` INT NOT NULL,
  `champspawn_id` INT NOT NULL,
  PRIMARY KEY (`run_id`, `champspawn_id`),
  CONSTRAINT `fk_run_has_champspawn_run1`
    FOREIGN KEY (`run_id`)
    REFERENCES `run` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_champspawn_champspawn1`
    FOREIGN KEY (`champspawn_id`)
    REFERENCES `champspawn` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_run_has_champspawn_champspawn1_idx` ON `run_has_champspawn` (`champspawn_id` ASC);

CREATE INDEX `fk_run_has_champspawn_run1_idx` ON `run_has_champspawn` (`run_id` ASC);

SET SQL_MODE = '';
DROP USER IF EXISTS admin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `first_name`, `last_name`, `active`, `role`) VALUES (1, 'test', 'test', 'test@gmail.com', 'test', 'test', 1, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `run`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `run` (`id`, `date_attended`, `solo`, `deaths`, `raided`, `user_id`) VALUES (1, NULL, 1, 2, 1, 1);
INSERT INTO `run` (`id`, `date_attended`, `solo`, `deaths`, `raided`, `user_id`) VALUES (2, NULL, 1, 0, 0, 1);
INSERT INTO `run` (`id`, `date_attended`, `solo`, `deaths`, `raided`, `user_id`) VALUES (3, NULL, 0, 1, 0, 1);
INSERT INTO `run` (`id`, `date_attended`, `solo`, `deaths`, `raided`, `user_id`) VALUES (4, NULL, 1, 0, 0, 1);
INSERT INTO `run` (`id`, `date_attended`, `solo`, `deaths`, `raided`, `user_id`) VALUES (5, NULL, 0, 0, 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `scroll`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `scroll` (`id`, `name`, `champspawn_id`) VALUES (1, 'Parrying', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `artifact`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `artifact` (`id`, `name`, `description`, `quantity`, `champspawn_id`) VALUES (1, 'Janna\'s Staff', 'Luck/Mage staff', '1', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Combat');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Wilderness');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Magic');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Bard');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Theif');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'Crafting');

COMMIT;


-- -----------------------------------------------------
-- Data for table `value`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `value` (`id`, `point_gain`) VALUES (1, 105);
INSERT INTO `value` (`id`, `point_gain`) VALUES (2, 110);
INSERT INTO `value` (`id`, `point_gain`) VALUES (3, 115);
INSERT INTO `value` (`id`, `point_gain`) VALUES (4, 120);

COMMIT;


-- -----------------------------------------------------
-- Data for table `scroll_has_value`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `scroll_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `champspawn`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `champspawn` (`id`, `name`, `location`) VALUES (1, 'Rikki', 'Destard');
INSERT INTO `champspawn` (`id`, `name`, `location`) VALUES (2, 'Mephitis', 'Terethan Keep');
INSERT INTO `champspawn` (`id`, `name`, `location`) VALUES (3, 'Primevil Lich', 'Stygian Abyss');

COMMIT;


-- -----------------------------------------------------
-- Data for table `run_has_champspawn`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `run_has_champspawn` (`run_id`, `champspawn_id`) VALUES (1, 1);
INSERT INTO `run_has_champspawn` (`run_id`, `champspawn_id`) VALUES (2, 1);
INSERT INTO `run_has_champspawn` (`run_id`, `champspawn_id`) VALUES (3, 1);
INSERT INTO `run_has_champspawn` (`run_id`, `champspawn_id`) VALUES (4, 1);
INSERT INTO `run_has_champspawn` (`run_id`, `champspawn_id`) VALUES (5, 2);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
