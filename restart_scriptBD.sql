SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `restart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `restart` ;

-- -----------------------------------------------------
-- Table `restart`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Usuario` (
  `matricula` VARCHAR(16) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NOT NULL,
  `tipo_usuario` SMALLINT NOT NULL,
  `data_cadastro` TIMESTAMP NOT NULL,
  `data_atualizacao` TIMESTAMP NULL,
  `telefone_residencial` VARCHAR(15) NULL,
  `telefone_celular` VARCHAR(15) NULL,
  `situacao` SMALLINT NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Laboratorio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_laboratorio` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Patrimonio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Patrimonio` (
  `num_patrimonio` VARCHAR(45) NOT NULL,
  `num_posicionamento` SMALLINT NOT NULL,
  `situacao` SMALLINT NOT NULL,
  `data_cadastro` TIMESTAMP NOT NULL,
  `data_atualizacao` TIMESTAMP NULL,
  `Laboratorio_id` INT NOT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`num_patrimonio`),
  INDEX `fk_Patrimonio_Laboratorio1_idx` (`Laboratorio_id` ASC),
  INDEX `fk_Patrimonio_Categoria1_idx` (`Categoria_id` ASC),
  CONSTRAINT `fk_Patrimonio_Laboratorio1`
    FOREIGN KEY (`Laboratorio_id`)
    REFERENCES `restart`.`Laboratorio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patrimonio_Categoria1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `restart`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Ocorrencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(350) NOT NULL,
  `estado_servico` SMALLINT NOT NULL,
  `data_cadastro` TIMESTAMP NOT NULL,
  `data_previa` TIMESTAMP NULL,
  `data_entrega` TIMESTAMP NULL,
  `data_atualizacao` TIMESTAMP NULL,
  `data_atendimento` TIMESTAMP NULL,
  `bolsista_alocado` VARCHAR(16) NULL,
  `Patrimonio_num_patrimonio` VARCHAR(45) NOT NULL,
  `Usuario_matricula` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Chamado_Patrimonio1_idx` (`Patrimonio_num_patrimonio` ASC),
  INDEX `fk_Ocorrencia_Usuario1_idx` (`Usuario_matricula` ASC),
  CONSTRAINT `fk_Chamado_Patrimonio1`
    FOREIGN KEY (`Patrimonio_num_patrimonio`)
    REFERENCES `restart`.`Patrimonio` (`num_patrimonio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ocorrencia_Usuario1`
    FOREIGN KEY (`Usuario_matricula`)
    REFERENCES `restart`.`Usuario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Defeito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Defeito` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` SMALLINT NOT NULL,
  `detalhe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Ocorrencia_has_Defeito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Ocorrencia_has_Defeito` (
  `Ocorrencia_id` INT NOT NULL,
  `Defeito_id` INT NOT NULL,
  PRIMARY KEY (`Ocorrencia_id`, `Defeito_id`),
  INDEX `fk_Ocorrencia_has_Defeito_Defeito1_idx` (`Defeito_id` ASC),
  INDEX `fk_Ocorrencia_has_Defeito_Ocorrencia1_idx` (`Ocorrencia_id` ASC),
  CONSTRAINT `fk_Ocorrencia_has_Defeito_Ocorrencia1`
    FOREIGN KEY (`Ocorrencia_id`)
    REFERENCES `restart`.`Ocorrencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ocorrencia_has_Defeito_Defeito1`
    FOREIGN KEY (`Defeito_id`)
    REFERENCES `restart`.`Defeito` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Imagem_HD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Imagem_HD` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_arquivo` VARCHAR(60) NOT NULL,
  `data_criacao` TIMESTAMP NOT NULL,
  `data_atualizacao` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Equipamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `modelo_processador` VARCHAR(45) NULL,
  `capacidade_ram` VARCHAR(20) NULL,
  `capacidade_hd` VARCHAR(20) NULL,
  `vencimento_garantia` TIMESTAMP NOT NULL,
  `Imagem_HD_id` INT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Configuracao_Imagem_HD1_idx` (`Imagem_HD_id` ASC),
  INDEX `fk_Equipamento_Categoria1_idx` (`Categoria_id` ASC),
  CONSTRAINT `fk_Configuracao_Imagem_HD1`
    FOREIGN KEY (`Imagem_HD_id`)
    REFERENCES `restart`.`Imagem_HD` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipamento_Categoria1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `restart`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Software`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Software` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `fabricante` VARCHAR(45) NULL,
  `versao` VARCHAR(10) NULL,
  `tipo_licenca` SMALLINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Software_has_Imagem_HD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Software_has_Imagem_HD` (
  `Software_id` INT NOT NULL,
  `Imagem_HD_id` INT NOT NULL,
  PRIMARY KEY (`Software_id`, `Imagem_HD_id`),
  INDEX `fk_Software_has_Imagem_Imagem1_idx` (`Imagem_HD_id` ASC),
  INDEX `fk_Software_has_Imagem_Software1_idx` (`Software_id` ASC),
  CONSTRAINT `fk_Software_has_Imagem_Software1`
    FOREIGN KEY (`Software_id`)
    REFERENCES `restart`.`Software` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Software_has_Imagem_Imagem1`
    FOREIGN KEY (`Imagem_HD_id`)
    REFERENCES `restart`.`Imagem_HD` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Licenca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Licenca` (
  `Software_id` INT NOT NULL,
  `Patrimonio_num_patrimonio` VARCHAR(45) NOT NULL,
  `codigo_licenca` VARCHAR(45) NULL,
  `data_expiracao` TIMESTAMP NULL,
  PRIMARY KEY (`Software_id`, `Patrimonio_num_patrimonio`),
  INDEX `fk_Software_has_Patrimonio_Patrimonio1_idx` (`Patrimonio_num_patrimonio` ASC),
  INDEX `fk_Software_has_Patrimonio_Software1_idx` (`Software_id` ASC),
  CONSTRAINT `fk_Software_has_Patrimonio_Software1`
    FOREIGN KEY (`Software_id`)
    REFERENCES `restart`.`Software` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Software_has_Patrimonio_Patrimonio1`
    FOREIGN KEY (`Patrimonio_num_patrimonio`)
    REFERENCES `restart`.`Patrimonio` (`num_patrimonio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restart`.`Configuracao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restart`.`Configuracao` (
  `nome_db` VARCHAR(45) NOT NULL,
  `servidor_smtp` VARCHAR(45) NOT NULL,
  `porta_smtp` INT NOT NULL,
  `email_smtp` VARCHAR(45) NOT NULL,
  `usuario_smtp` VARCHAR(45) NOT NULL,
  `senha_smtp` VARCHAR(45) NOT NULL,
  `seguranca_smtp` CHAR(3) NOT NULL,
  `servidor_db` VARCHAR(45) NOT NULL,
  `usuario_db` VARCHAR(45) NOT NULL,
  `senha_db` VARCHAR(45) NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
