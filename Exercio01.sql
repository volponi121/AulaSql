-- MySQL  generated by MySQL Workbench
-- 08/30/18 15:48:07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENDA` (
  `ID_VENDA` INT NOT NULL AUTO_INCREMENT,
  `VALOR_TOTAL_VENDA` DECIMAL(4,2) ZEROFILL NOT NULL,
  `DESCONTO` DECIMAL(4,2) ZEROFILL NOT NULL,
  `DATA` DATE NOT NULL,
  `DATA_CADASTRO` DATETIME NOT NULL,
  `USUARIO_CADASTRO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_VENDA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUTO` (
  `ID_PRODUTO` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  `VALOR_UNITARIO` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ID_PRODUTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENDA_has_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENDA_has_PRODUTO` (
  `VENDA_ID_VENDA` INT NOT NULL AUTO_INCREMENT,
  `PRODUTO_ID_PRODUTO` INT NOT NULL,
  `QUANTIDADE` INT NOT NULL,
  `VALOR_TOTAL` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`VENDA_ID_VENDA`, `PRODUTO_ID_PRODUTO`),
  INDEX `fk_VENDA_has_PRODUTO_PRODUTO1_idx` (`PRODUTO_ID_PRODUTO` ASC),
  INDEX `fk_VENDA_has_PRODUTO_VENDA_idx` (`VENDA_ID_VENDA` ASC),
  CONSTRAINT `fk_VENDA_has_PRODUTO_VENDA`
    FOREIGN KEY (`VENDA_ID_VENDA`)
    REFERENCES `mydb`.`VENDA` (`ID_VENDA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENDA_has_PRODUTO_PRODUTO1`
    FOREIGN KEY (`PRODUTO_ID_PRODUTO`)
    REFERENCES `mydb`.`PRODUTO` (`ID_PRODUTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


drop table VENDA_PRODUTO;
drop table VENDA_HAS_PRODUTO;
drop table PRODUTO;

desc VENDA;
desc VENDA_HAS_PRODUTO;
desc PRODUTO;

SELECT * FROM VENDA; 	
SELECT * FROM VENDA_HAS_PRODUTO;
SELECT * FROM  PRODUTO;

INSERT INTO PRODUTO (DESCRICAO,VALOR_UNITARIO)
	VALUES('BOLA DE FUTEBOL', '2,50');
    
DELETE FROM PRODUTO WHERE ID_PRODUTO =1; 

UPDATE PRODUTO SET VALOR_UNITARIO = '3,22'
	WHERE ID_PRODUTO = 2;
    
INSERT INTO VENDA (DESCONTO,VALOR_TOTAL_VENDA)
	VALUES(20.00,2200.00);
    
INSERT INTO PRODUTO(DESCRICAO,VALOR_UNITARIO)
	VALUES('Bola De Futebol',2.50);
INSERT INTO PRODUTO(DESCRICAO,VALOR_UNITARIO)
	VALUES('Capacete',35.00);
INSERT INTO PRODUTO(DESCRICAO,VALOR_UNITARIO)
	VALUES('Tênis',200.00);
INSERT INTO PRODUTO(DESCRICAO,VALOR_UNITARIO)
	VALUES('Chinelo',10.00);


INSERT INTO VENDA_HAS_PRODUTO(VENDA_ID_VENDA,PRODUTO_ID_PRODUTO,QUANTIDADE,VALOR_TOTAL)
	VALUES(1,1,2,5.00);
INSERT INTO VENDA_HAS_PRODUTO(VENDA_ID_VENDA,PRODUTO_ID_PRODUTO,QUANTIDADE,VALOR_TOTAL)
	VALUES(1,2,9,35.00);
INSERT INTO VENDA_HAS_PRODUTO(VENDA_ID_VENDA,PRODUTO_ID_PRODUTO,QUANTIDADE,VALOR_TOTAL)
	VALUES(1,3,9,1800.00);
INSERT INTO VENDA_HAS_PRODUTO(VENDA_ID_VENDA,PRODUTO_ID_PRODUTO,QUANTIDADE,VALOR_TOTAL)
	VALUES(1,4,9,100.00);
    
