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
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(200) NULL,
  `email` VARCHAR(200) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `active` TINYINT NULL DEFAULT 1,
  `role` VARCHAR(200) NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artifact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artifact` ;

CREATE TABLE IF NOT EXISTS `artifact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `quantity` VARCHAR(45) NULL,
  `run_id` INT NOT NULL,
  `slot` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_artifact_champspawn`
    FOREIGN KEY (`run_id`)
    REFERENCES `run` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_artifact_champspawn_idx` ON `artifact` (`run_id` ASC);


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `value`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `value` ;

CREATE TABLE IF NOT EXISTS `value` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `run_has_champspawn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `run_has_champspawn` ;

CREATE TABLE IF NOT EXISTS `run_has_champspawn` (
  `run_id` INT NOT NULL AUTO_INCREMENT,
  `champspawn_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT 1,
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


-- -----------------------------------------------------
-- Table `run_has_scroll`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `run_has_scroll` ;

CREATE TABLE IF NOT EXISTS `run_has_scroll` (
  `run_id` INT NOT NULL,
  `scroll_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`run_id`, `scroll_id`),
  CONSTRAINT `fk_run_has_scroll_run1`
    FOREIGN KEY (`run_id`)
    REFERENCES `run` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_run_has_scroll_scroll1`
    FOREIGN KEY (`scroll_id`)
    REFERENCES `scroll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_run_has_scroll_scroll1_idx` ON `run_has_scroll` (`scroll_id` ASC);

CREATE INDEX `fk_run_has_scroll_run1_idx` ON `run_has_scroll` (`run_id` ASC);

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
INSERT INTO `user` (`id`, `username`, `password`, `email`, `first_name`, `last_name`, `active`, `role`) VALUES (1, 'test', '$2a$10$lppE7mc9ZVOWOCjEZdXoi.bwiPTlKN9Jsze1uD6eUYBeI9GMqfRh.', 'test@gmail.com', 'test', 'test', 1, 'admin');

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
INSERT INTO `scroll` (`id`, `name`) VALUES (1, 'Swordsmanship');
INSERT INTO `scroll` (`id`, `name`) VALUES (2, 'Tactics');
INSERT INTO `scroll` (`id`, `name`) VALUES (3, 'Fencing');
INSERT INTO `scroll` (`id`, `name`) VALUES (4, 'Anatomy');
INSERT INTO `scroll` (`id`, `name`) VALUES (5, 'Mace Fighting');
INSERT INTO `scroll` (`id`, `name`) VALUES (6, 'Healing');
INSERT INTO `scroll` (`id`, `name`) VALUES (7, 'Archery');
INSERT INTO `scroll` (`id`, `name`) VALUES (8, 'Throwing');
INSERT INTO `scroll` (`id`, `name`) VALUES (9, 'Wrestling');
INSERT INTO `scroll` (`id`, `name`) VALUES (10, 'Bushido');
INSERT INTO `scroll` (`id`, `name`) VALUES (11, 'Parrying');
INSERT INTO `scroll` (`id`, `name`) VALUES (12, 'Magery');
INSERT INTO `scroll` (`id`, `name`) VALUES (13, 'Meditation');
INSERT INTO `scroll` (`id`, `name`) VALUES (14, 'Evaluating Intelligence');
INSERT INTO `scroll` (`id`, `name`) VALUES (15, 'Resisting Spells');
INSERT INTO `scroll` (`id`, `name`) VALUES (16, 'Stealing');
INSERT INTO `scroll` (`id`, `name`) VALUES (17, 'Stealth');
INSERT INTO `scroll` (`id`, `name`) VALUES (18, 'Animal Taming');
INSERT INTO `scroll` (`id`, `name`) VALUES (19, 'Animal Lore');
INSERT INTO `scroll` (`id`, `name`) VALUES (20, 'Veterinarian');
INSERT INTO `scroll` (`id`, `name`) VALUES (21, 'Musicianship ');
INSERT INTO `scroll` (`id`, `name`) VALUES (22, 'Provocation');
INSERT INTO `scroll` (`id`, `name`) VALUES (23, 'Peacemaking');
INSERT INTO `scroll` (`id`, `name`) VALUES (24, 'Discordance');
INSERT INTO `scroll` (`id`, `name`) VALUES (25, 'Chivalry');
INSERT INTO `scroll` (`id`, `name`) VALUES (26, 'Focus');
INSERT INTO `scroll` (`id`, `name`) VALUES (27, 'Necromancy');
INSERT INTO `scroll` (`id`, `name`) VALUES (28, 'Ninjitstu');
INSERT INTO `scroll` (`id`, `name`) VALUES (29, 'Spellweaving');
INSERT INTO `scroll` (`id`, `name`) VALUES (30, 'Spirit Speak');
INSERT INTO `scroll` (`id`, `name`) VALUES (31, 'Mystic');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artifact`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `artifact` (`id`, `name`, `description`, `quantity`, `run_id`, `slot`) VALUES (1, 'Janna\'s Staff', 'Luck/Mage staff', '1', 1, 'Hand');

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
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Thief');
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
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (1, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (1, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (1, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (1, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (2, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (2, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (2, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (2, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (3, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (3, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (3, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (3, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (4, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (4, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (4, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (4, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (5, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (5, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (5, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (5, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (6, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (6, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (6, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (6, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (7, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (7, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (7, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (7, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (8, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (8, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (8, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (8, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (9, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (9, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (9, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (9, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (10, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (10, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (10, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (10, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (11, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (11, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (11, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (11, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (12, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (12, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (12, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (12, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (13, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (13, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (13, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (13, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (14, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (14, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (14, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (14, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (15, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (15, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (15, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (15, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (16, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (16, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (16, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (16, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (17, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (17, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (17, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (17, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (18, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (18, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (18, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (18, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (19, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (19, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (19, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (19, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (20, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (20, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (20, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (20, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (21, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (21, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (21, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (21, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (22, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (22, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (22, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (22, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (23, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (23, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (23, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (23, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (24, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (24, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (24, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (24, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (25, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (25, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (25, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (25, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (26, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (26, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (26, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (26, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (27, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (27, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (27, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (27, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (28, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (28, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (28, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (28, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (29, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (29, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (29, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (29, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (30, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (30, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (30, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (30, 4);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (31, 1);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (31, 2);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (31, 3);
INSERT INTO `scroll_has_value` (`scroll_id`, `value_id`) VALUES (31, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `scroll_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (1, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (2, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (3, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (4, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (5, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (6, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (7, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (8, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (9, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (10, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (11, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (12, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (13, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (14, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (15, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (16, 5);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (17, 5);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (18, 2);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (19, 2);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (20, 2);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (21, 4);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (22, 4);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (23, 4);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (24, 4);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (25, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (26, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (27, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (28, 1);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (29, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (30, 3);
INSERT INTO `scroll_has_category` (`scroll_id`, `category_id`) VALUES (31, 3);

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
INSERT INTO `run_has_champspawn` (`run_id`, `champspawn_id`, `quantity`) VALUES (1, 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `run_has_scroll`
-- -----------------------------------------------------
START TRANSACTION;
USE `uodb`;
INSERT INTO `run_has_scroll` (`run_id`, `scroll_id`, `quantity`) VALUES (1, 5, 1);
INSERT INTO `run_has_scroll` (`run_id`, `scroll_id`, `quantity`) VALUES (1, 2, 2);
INSERT INTO `run_has_scroll` (`run_id`, `scroll_id`, `quantity`) VALUES (1, 16, 1);
INSERT INTO `run_has_scroll` (`run_id`, `scroll_id`, `quantity`) VALUES (1, 24, 1);
INSERT INTO `run_has_scroll` (`run_id`, `scroll_id`, `quantity`) VALUES (1, 3, 1);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
