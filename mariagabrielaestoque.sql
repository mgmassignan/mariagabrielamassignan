-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Fev-2025 às 21:03
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mariagabrielaestoque`
--
CREATE DATABASE IF NOT EXISTS `mariagabrielaestoque` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mariagabrielaestoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL COMMENT 'Esse campo é responsavel pela chave primária do cliente',
  `nome_cliente` varchar(45) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo atributo cliente',
  `endereco` varchar(10) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo endereço do cliente',
  `cidade` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo atributo cidade do cliente',
  `cep` varchar(10) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo atributo cep do cliente',
  `cnpj` varchar(30) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo atributo cnpj do cliente',
  `uf` char(2) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo atributo unidade federativa',
  `ie` int(11) DEFAULT NULL COMMENT 'Esse campo é responsavel pelo atributo inscrição estadual do cliente\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome_cliente`, `endereco`, `cidade`, `cep`, `cnpj`, `uf`, `ie`) VALUES
(20, 'Beth', 'Av Climéri', 'São Paulo', '25679300', 'SP', '32', 9280),
(110, 'Jorge', 'Rua Caiapó', 'Curitiba', '30078500', '1451276498349', 'PR', 0),
(130, 'Edmar', 'Rua da Pra', 'Salvador', '30079300', 'BA', '23', 7121),
(157, 'Paulo', 'Tv. Moraes', 'Londrina', 'null', 'PR', '32', 1923),
(180, 'Livio', 'Av. Beira ', 'Florianópolis', '30077500', 'SC', '12', 0),
(222, 'Lúcia', 'Rua Itabir', 'Belo Horizonte', '22124391', 'MG', '28', 2985),
(234, 'José', 'Quadra 3 b', 'Brasilia', '22841650', 'DF', '21', 2931),
(260, 'Susana', 'Rua Lopes ', 'Niterói', '30046500', 'RJ', '21', 2530),
(290, 'Renato', 'Rua Meirel', 'São Paulo', '30225900', 'SP', '13', 1820),
(390, 'Sebastião', 'Rua da Igr', 'Uberaba', '30438700', 'MG', '32', 9071),
(410, 'Rodolfo', 'Largo da L', 'Rio de Janeiro', '30078900', 'RJ', '12', 7431),
(720, 'Ana', 'rua, 17 n.', 'Niterói', '243558-310', '12113231/0001-34', 'RJ', 2134),
(830, 'Mauricio', 'Av Paulist', 'São Paulo', '3012683', 'SP', '32', 9343),
(870, 'Flavio', 'Av. Pres V', 'São Paulo', '22763931', '2253412693879', '46', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_de_pedido`
--

CREATE TABLE `item_de_pedido` (
  `pedido_num_pedido` int(11) NOT NULL,
  `pedido_cod_produto` int(11) NOT NULL,
  `qntde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `item_de_pedido`
--

INSERT INTO `item_de_pedido` (`pedido_num_pedido`, `pedido_cod_produto`, `qntde`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `prazo_entrega` int(10) DEFAULT NULL,
  `cliente_cod_cliente` int(11) NOT NULL,
  `vendedor_cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `prazo_entrega`, `cliente_cod_cliente`, `vendedor_cod_cliente`) VALUES
(91, 20, 260, 11),
(97, 20, 720, 101),
(98, 20, 410, 209),
(101, 15, 720, 101),
(103, 20, 260, 11),
(104, 30, 110, 101),
(105, 15, 180, 240),
(108, 15, 290, 310),
(111, 20, 260, 240),
(119, 30, 390, 250),
(121, 20, 410, 209),
(127, 10, 410, 11),
(137, 20, 720, 720),
(138, 20, 260, 11),
(143, 30, 20, 111),
(148, 20, 720, 101),
(189, 15, 870, 213),
(203, 30, 830, 250);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL,
  `unid_produto` varchar(10) DEFAULT NULL,
  `desc_produt` varchar(50) DEFAULT NULL,
  `valor_unit` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`cod_produto`, `unid_produto`, `desc_produt`, `valor_unit`) VALUES
(13, 'G', 'Ouro', '6.18'),
(22, 'M', 'Linho', '0.11'),
(25, 'Kg', 'Queijo', '0.97'),
(30, 'SAC', 'Açucar', '0.30'),
(31, 'Bar', 'Chocolate', '0.87'),
(45, 'M', 'Madeira', '0.25'),
(53, 'M', 'Linha', '1.80'),
(77, 'M', 'Papel', '1.05'),
(78, 'L', 'Vinho', '2.00'),
(87, 'M', 'Cano', '1.97');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `cod_vendedor` int(11) NOT NULL,
  `nome_vendedor` varchar(50) DEFAULT NULL,
  `sal_fixo` decimal(15,2) DEFAULT NULL,
  `faixa_comissao` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`cod_vendedor`, `nome_vendedor`, `sal_fixo`, `faixa_comissao`) VALUES
(11, 'João', '2780.00', 'C'),
(101, 'João', '2650.32', 'C'),
(111, 'Carlos', '2490.00', 'A'),
(209, 'José', '1800.00', 'C'),
(213, 'Jonas', '2300.50', 'A'),
(240, 'Antonio', '9500.00', 'C'),
(250, 'Mauricío', '2930.00', 'B'),
(310, 'Josias', '870.00', 'B'),
(720, 'Felipe', '4600.00', 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD KEY `fk_pedido_num_pedido` (`pedido_num_pedido`),
  ADD KEY `fk_pedido_cod_produto` (`pedido_cod_produto`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `FK_CLIENTE_PEDIDO` (`cliente_cod_cliente`),
  ADD KEY `FK_VENDEDOR_PEDIDO` (`vendedor_cod_cliente`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`cod_vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `fk_pedido_cod_produto` FOREIGN KEY (`pedido_cod_produto`) REFERENCES `produto` (`cod_produto`),
  ADD CONSTRAINT `fk_pedido_num_pedido` FOREIGN KEY (`pedido_num_pedido`) REFERENCES `pedido` (`num_pedido`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_CLIENTE_PEDIDO` FOREIGN KEY (`cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  ADD CONSTRAINT `FK_VENDEDOR_PEDIDO` FOREIGN KEY (`vendedor_cod_cliente`) REFERENCES `vendedor` (`cod_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
