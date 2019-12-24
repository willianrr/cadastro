-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 24-Dez-2019 às 01:09
-- Versão do servidor: 5.7.24
-- versão do PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cadastro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `list_user`
--

DROP TABLE IF EXISTS `list_user`;
CREATE TABLE IF NOT EXISTS `list_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `birth` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 NOT NULL,
  `sex` varchar(30) NOT NULL,
  `cep` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `number` varchar(20) NOT NULL,
  `complement` varchar(20) NOT NULL,
  `district` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `list_user`
--

INSERT INTO `list_user` (`id`, `name`, `birth`, `state`, `city`, `sex`, `cep`, `address`, `number`, `complement`, `district`) VALUES
(7, 'willian', '22/01/1994', 'PR', 'Maringá', 'masculino', '87053670', 'rua david faustino de souza', '54', 'segunda rua', 'Parque Taruma'),
(14, 'adalto', '11/11/1950', 'SP', 'sao paulo', 'masculino', '87053670', 'rua sao paulo', '22', 'terceira rua', 'distrito sao paulo');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
