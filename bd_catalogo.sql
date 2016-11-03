-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tempo de Geração: 27/10/2016 às 09:59
-- Versão do servidor: 5.5.49-cll-lve
-- Versão do PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `bd_catalogo`
--
CREATE DATABASE IF NOT EXISTS bd_catalogo;

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivo`
--

CREATE TABLE IF NOT EXISTS `arquivo` (
  `id`            INT(11)     NOT NULL AUTO_INCREMENT,
  `caminho`       TEXT,
  `extensao`      VARCHAR(10) NOT NULL,
  `nome_original` VARCHAR(180)         DEFAULT NULL,
  `ativado`       TINYINT(1)           DEFAULT '1',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atributo`
--

CREATE TABLE IF NOT EXISTS `atributo` (
  `id`           INT(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` INT(11) NOT NULL,
  `nome`         VARCHAR(180)     DEFAULT NULL,
  `tipo`         VARCHAR(180)     DEFAULT NULL,
  `ativado`      TINYINT(1)       DEFAULT '1',
  PRIMARY KEY (`id`, `categoria_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 16;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id`                  INT(11) NOT NULL AUTO_INCREMENT,
  `nome`                VARCHAR(100)     DEFAULT NULL,
  `datacriacao`         DATE             DEFAULT NULL,
  `dataexclusao`        DATE             DEFAULT NULL,
  `ativado`             TINYINT(1)       DEFAULT '1',
  `dataultimaalteracao` DATE             DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id`                  INT(11)     NOT NULL AUTO_INCREMENT,
  `nome`                VARCHAR(180)         DEFAULT NULL,
  `descricao`           TEXT,
  `tipo`                VARCHAR(20) NOT NULL,
  `cpf_ou_cnpj`         VARCHAR(30)          DEFAULT NULL,
  `datacriacao`         DATE                 DEFAULT NULL,
  `dataultimaalteracao` DATE                 DEFAULT NULL,
  `dataexclusao`        DATE                 DEFAULT NULL,
  `ativado`             TINYINT(1)           DEFAULT '1',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 2;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cor`
--

CREATE TABLE IF NOT EXISTS `cor` (
  `id`               INT(11) NOT NULL AUTO_INCREMENT,
  `valorHexadecimal` VARCHAR(50)      DEFAULT '#c11d0b',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 2;

INSERT INTO `cor` (`id`, `valorHexadecimal`) VALUES (1, '#3D3D3D');
-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem`
--

CREATE TABLE IF NOT EXISTS `imagem` (
  `idimagem`   INT(11)      NOT NULL AUTO_INCREMENT,
  `produto_id` INT(11)      NOT NULL,
  `caminho`    VARCHAR(120) NOT NULL,
  `posicao`    INT(11)               DEFAULT NULL,
  PRIMARY KEY (`idimagem`, `produto_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 12;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id`                  INT(11)      NOT NULL AUTO_INCREMENT,
  `nome`                VARCHAR(148) NOT NULL,
  `descricao`           TEXT         NOT NULL,
  `imagem`              TEXT         NOT NULL,
  `preco`               FLOAT(10, 2) NOT NULL DEFAULT '0.00',
  `ativado`             TINYINT(1)   NOT NULL DEFAULT '1',
  `imagemprincipal`     VARCHAR(100)          DEFAULT '',
  `mostrapreco`         TINYINT(1)   NOT NULL DEFAULT '0',
  `categoria_id`        INT(11)      NOT NULL,
  `secao_id`            INT(11)      NOT NULL,
  `datacriacao`         DATE                  DEFAULT NULL,
  `dataexclusao`        DATE                  DEFAULT NULL,
  `dataultimaalteracao` DATE                  DEFAULT NULL,
  `usuario_id`          INT(11)      NOT NULL,
  PRIMARY KEY (`id`, `categoria_id`, `secao_id`, `usuario_id`),
  KEY `fk_produto_categoria1_idx` (`categoria_id`),
  KEY `fk_produto_secao1_idx` (`secao_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `secao`
--

CREATE TABLE IF NOT EXISTS `secao` (
  `id`                  INT(11) NOT NULL AUTO_INCREMENT,
  `nome`                VARCHAR(180)     DEFAULT NULL,
  `datacriacao`         DATETIME         DEFAULT NULL,
  `dataexclusao`        DATETIME         DEFAULT NULL,
  `dataultimaalteracao` DATETIME         DEFAULT NULL,
  `ativado`             TINYINT(1)       DEFAULT '1',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 5;

-- --------------------------------------------------------

--
-- Estrutura para tabela `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id`            INT(11) NOT NULL AUTO_INCREMENT,
  `identificador` VARCHAR(20)      DEFAULT NULL,
  `arquivo_id`    INT(11) NOT NULL,
  `ativado`       TINYINT(1)       DEFAULT '1',
  `cliente_id`    INT(11) NOT NULL,
  PRIMARY KEY (`id`, `arquivo_id`, `cliente_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id`                  INT(11) NOT NULL AUTO_INCREMENT,
  `nome`                VARCHAR(148)     DEFAULT NULL,
  `email`               VARCHAR(158)     DEFAULT NULL,
  `login`               VARCHAR(50)      DEFAULT NULL,
  `senha`               VARCHAR(32)      DEFAULT NULL,
  `nivel`               INT(11)          DEFAULT '1',
  `ativado`             TINYINT(1)       DEFAULT '1',
  `imagem`              TEXT,
  `datacriacao`         VARCHAR(50)      DEFAULT NULL,
  `dataexclusao`        VARCHAR(50)      DEFAULT NULL,
  `dataultimaalteracao` VARCHAR(50)      DEFAULT NULL,
  `cliente_id`          INT(11) NOT NULL,
  PRIMARY KEY (`id`, `cliente_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 3;

INSERT INTO `usuario` (`id`, `nome`, `email`, `login`, `senha`, `nivel`, `ativado`, `imagem`, `datacriacao`, `dataexclusao`, `dataultimaalteracao`, `cliente_id`)
VALUES
  (1, 'Administrador', 'admin@catalog.com', 'admin', 'admin', 4, 1, '../imagens/default-user-img.jpg', '11/02/1998',
      NULL, NULL, 0);
-- --------------------------------------------------------

--
-- Estrutura para tabela `valor_atributo`
--

CREATE TABLE IF NOT EXISTS `valor_atributo` (
  `id`                    INT(11) NOT NULL AUTO_INCREMENT,
  `valor`                 VARCHAR(190)     DEFAULT NULL,
  `produto_id`            INT(11) NOT NULL,
  `atributo_id`           INT(11) NOT NULL,
  `atributo_categoria_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `produto_id`, `atributo_id`, `atributo_categoria_id`),
  KEY `fk_valor_atributo_produto1_idx` (`produto_id`),
  KEY `fk_valor_atributo_atributo1_idx` (`atributo_id`, `atributo_categoria_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 19;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
