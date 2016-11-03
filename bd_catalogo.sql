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


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `bd_catalogo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivo`
--

CREATE TABLE IF NOT EXISTS `arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caminho` text,
  `extensao` varchar(10) NOT NULL,
  `nome_original` varchar(180) DEFAULT NULL,
  `ativado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atributo`
--

CREATE TABLE IF NOT EXISTS `atributo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `nome` varchar(180) DEFAULT NULL,
  `tipo` varchar(180) DEFAULT NULL,
  `ativado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `dataexclusao` date DEFAULT NULL,
  `ativado` tinyint(1) DEFAULT '1',
  `dataultimaalteracao` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(180) DEFAULT NULL,
  `descricao` text,
  `tipo` varchar(20) NOT NULL,
  `cpf_ou_cnpj` varchar(30) DEFAULT NULL,
  `datacriacao` date DEFAULT NULL,
  `dataultimaalteracao` date DEFAULT NULL,
  `dataexclusao` date DEFAULT NULL,
  `ativado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cor`
--

CREATE TABLE IF NOT EXISTS `cor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valorHexadecimal` varchar(50) DEFAULT '#c11d0b',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem`
--

CREATE TABLE IF NOT EXISTS `imagem` (
  `idimagem` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `caminho` varchar(120) NOT NULL,
  `posicao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idimagem`,`produto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(148) NOT NULL,
  `descricao` text NOT NULL,
  `imagem` text NOT NULL,
  `preco` float(10,2) NOT NULL DEFAULT '0.00',
  `ativado` tinyint(1) NOT NULL DEFAULT '1',
  `imagemprincipal` varchar(100) DEFAULT '',
  `mostrapreco` tinyint(1) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL,
  `secao_id` int(11) NOT NULL,
  `datacriacao` date DEFAULT NULL,
  `dataexclusao` date DEFAULT NULL,
  `dataultimaalteracao` date DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`categoria_id`,`secao_id`,`usuario_id`),
  KEY `fk_produto_categoria1_idx` (`categoria_id`),
  KEY `fk_produto_secao1_idx` (`secao_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `secao`
--

CREATE TABLE IF NOT EXISTS `secao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(180) DEFAULT NULL,
  `datacriacao` datetime DEFAULT NULL,
  `dataexclusao` datetime DEFAULT NULL,
  `dataultimaalteracao` datetime DEFAULT NULL,
  `ativado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificador` varchar(20) DEFAULT NULL,
  `arquivo_id` int(11) NOT NULL,
  `ativado` tinyint(1) DEFAULT '1',
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`arquivo_id`,`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(148) DEFAULT NULL,
  `email` varchar(158) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `nivel` int(11) DEFAULT '1',
  `ativado` tinyint(1) DEFAULT '1',
  `imagem` text,
  `datacriacao` varchar(50) DEFAULT NULL,
  `dataexclusao` varchar(50) DEFAULT NULL,
  `dataultimaalteracao` varchar(50) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`cliente_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `valor_atributo`
--

CREATE TABLE IF NOT EXISTS `valor_atributo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(190) DEFAULT NULL,
  `produto_id` int(11) NOT NULL,
  `atributo_id` int(11) NOT NULL,
  `atributo_categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`produto_id`,`atributo_id`,`atributo_categoria_id`),
  KEY `fk_valor_atributo_produto1_idx` (`produto_id`),
  KEY `fk_valor_atributo_atributo1_idx` (`atributo_id`,`atributo_categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
