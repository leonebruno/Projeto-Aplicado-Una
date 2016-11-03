-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2016 às 02:20
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qrschool`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_alunos`
--

CREATE TABLE `tbl_alunos` (
  `Ra` int(11) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Uuid` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_alunos`
--

INSERT INTO `tbl_alunos` (`Ra`, `Senha`, `Nome`, `Sexo`, `DataNasc`, `Email`, `Uuid`) VALUES
(30000001, '30000001', 'Donal D. Duck', 'M', '1978-02-28', 'donald@dysney.com', NULL),
(30000003, '30000003', 'Rolando Lero', 'M', '1966-04-01', 'rolanastrada@escolinha.com.br', NULL),
(30000004, '30000004', 'Dino Da Silva Sauro', 'M', '0001-01-30', 'dino@saurus.com', NULL),
(30000005, '30000005', 'Scarlet Johanssen', 'F', '1980-05-25', 'alinda@marvel.com', NULL),
(31611542, '31611542', 'Bruno Leone A.P. Correa', 'M', '1997-05-08', 'leone.analistadesistemas@outlook.com.br', NULL),
(31627052, '31627052', 'Izack G.Passos Rodrigues', 'M', '1908-01-17', 'izackbh@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cursos`
--

CREATE TABLE `tbl_cursos` (
  `Regis_Curso` int(11) NOT NULL,
  `Nome` varchar(40) DEFAULT NULL,
  `Sigla` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_cursos`
--

INSERT INTO `tbl_cursos` (`Regis_Curso`, `Nome`, `Sigla`) VALUES
(1000, 'SISTEMA DE INFORMAÇÕES', 'SI'),
(1001, 'ANALISE E DESENVOLVIMENTO DE SISTEMAS', 'ADS'),
(1002, 'CIÊNCIAS DA COMPUTAÇÃO', 'CP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_disciplinas`
--

CREATE TABLE `tbl_disciplinas` (
  `CodDisc` int(11) NOT NULL,
  `NomeDisc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_disciplinas`
--

INSERT INTO `tbl_disciplinas` (`CodDisc`, `NomeDisc`) VALUES
(1000, 'Banco De Dados I'),
(1001, 'Projeto PI'),
(1002, 'Praticas Da Programaçao'),
(1003, 'Fundamentos Da Programaçao'),
(1004, 'Gerencia De Ti'),
(1005, 'Segurança Da Informaçao'),
(1006, 'Banco De Dados Ii'),
(1007, 'Aplicações Web'),
(1008, 'Engenharia De Software');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_professores`
--

CREATE TABLE `tbl_professores` (
  `CodProf` int(11) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_professores`
--

INSERT INTO `tbl_professores` (`CodProf`, `Senha`, `Nome`, `Email`, `Sexo`) VALUES
(1, '1', 'Rodrigo', 'rodrigo@una.br', 'M'),
(2, '2', 'Alexandre', 'motanha@una.br', 'M'),
(3, '3', 'Flavio', 'flavio@una.br', 'M'),
(4, '4', 'Roberto', 'roberto@una.br', 'M'),
(5, '5', 'Fabricio', 'fabricio@una.br', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_salas`
--

CREATE TABLE `tbl_salas` (
  `CodSala` int(11) NOT NULL,
  `Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_salas`
--

INSERT INTO `tbl_salas` (`CodSala`, `Num`) VALUES
(1000, 255),
(1001, 256),
(1002, 257),
(1003, 258),
(1004, 259),
(1005, 260),
(1006, 261);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_alunos`
--
ALTER TABLE `tbl_alunos`
  ADD PRIMARY KEY (`Ra`);

--
-- Indexes for table `tbl_cursos`
--
ALTER TABLE `tbl_cursos`
  ADD PRIMARY KEY (`Regis_Curso`);

--
-- Indexes for table `tbl_disciplinas`
--
ALTER TABLE `tbl_disciplinas`
  ADD PRIMARY KEY (`CodDisc`);

--
-- Indexes for table `tbl_professores`
--
ALTER TABLE `tbl_professores`
  ADD PRIMARY KEY (`CodProf`);

--
-- Indexes for table `tbl_salas`
--
ALTER TABLE `tbl_salas`
  ADD PRIMARY KEY (`CodSala`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_disciplinas`
--
ALTER TABLE `tbl_disciplinas`
  MODIFY `CodDisc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;
--
-- AUTO_INCREMENT for table `tbl_salas`
--
ALTER TABLE `tbl_salas`
  MODIFY `CodSala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
