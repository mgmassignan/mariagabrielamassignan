-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/02/2025 às 21:07
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque_de_moveis`
--
CREATE DATABASE IF NOT EXISTS `estoque_de_moveis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `estoque_de_moveis`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `InserirDistribuidora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirDistribuidora` (IN `p_id_distribuidora` INT, IN `p_data_entrega` VARCHAR(9), IN `p_ctt_distribuidora` VARCHAR(15), IN `p_nome_distribuidora` VARCHAR(45), IN `p_movimento_vendas` VARCHAR(45), IN `p_descricao_produtos` VARCHAR(45))   BEGIN
    INSERT INTO distribuidora (id_distribuidora, data_entrega, ctt_distribuidora, nome_distribuidora, movimento_vendas, descricao_produtos)
    VALUES (p_id_distribuidora, p_data_entrega, p_ctt_distribuidora, p_nome_distribuidora, p_movimento_vendas, p_descricao_produtos);
END$$

DROP PROCEDURE IF EXISTS `InserirDistribuidoraVerificando`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirDistribuidoraVerificando` (IN `p_id_distribuidora` INT, IN `p_data_entrega` VARCHAR(9), IN `p_ctt_distribuidora` VARCHAR(15), IN `p_nome_distribuidora` VARCHAR(45), IN `p_movimento_vendas` VARCHAR(45), IN `p_descricao_produtos` VARCHAR(45))   BEGIN
    IF NOT EXISTS (SELECT 1 FROM distribuidora WHERE id_distribuidora = p_id_distribuidora) THEN
        INSERT INTO distribuidora (id_distribuidora, data_entrega, ctt_distribuidora, nome_distribuidora, movimento_vendas, descricao_produtos)
        VALUES (p_id_distribuidora, p_data_entrega, p_ctt_distribuidora, p_nome_distribuidora, p_movimento_vendas, p_descricao_produtos);
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: ID da distribuidora já existe.';
    END IF;
END$$

DROP PROCEDURE IF EXISTS `InserirFornecedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirFornecedor` (IN `p_id_fornecedor` INT, IN `p_salario_fornecedor` VARCHAR(10), IN `p_nome_fornecedor` VARCHAR(45), IN `p_ctt_fornecedor` VARCHAR(9), IN `p_tipo_produto` VARCHAR(45), IN `p_email_fornecedor` VARCHAR(45), IN `p_cliente_cpf_clienteint` VARCHAR(11), IN `p_cliente_produto_cod_produto` INT)   BEGIN
    INSERT INTO fornecedor (
        id_fornecedor,
        salario_fornecedor,
        nome_fornecedor,
        ctt_fornecedor,
        tipo_produto,
        email_fornecedor,
        cliente_cpf_clienteint,
        cliente_produto_cod_produto
    )
    VALUES (
        p_id_fornecedor,
        p_salario_fornecedor,
        p_nome_fornecedor,
        p_ctt_fornecedor,
        p_tipo_produto,
        p_email_fornecedor,
        p_cliente_cpf_clienteint,
        p_cliente_produto_cod_produto
    );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cpf_cliente` int(11) NOT NULL,
  `tel_cliente` varchar(15) NOT NULL,
  `email_cliente` varchar(45) NOT NULL,
  `idade_cliente` varchar(2) NOT NULL,
  `nome_cliente` varchar(45) NOT NULL,
  `cep_cliente` varchar(8) NOT NULL,
  `produto_cod_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `distribuidora`
--

DROP TABLE IF EXISTS `distribuidora`;
CREATE TABLE `distribuidora` (
  `id_distribuidora` int(11) NOT NULL,
  `data_entrega` varchar(9) NOT NULL,
  `ctt_distribuidora` varchar(15) NOT NULL,
  `nome_distribuidora` varchar(45) NOT NULL,
  `movimento_vendas` varchar(45) NOT NULL,
  `descricao_produtos` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `distribuidora`
--

INSERT INTO `distribuidora` (`id_distribuidora`, `data_entrega`, `ctt_distribuidora`, `nome_distribuidora`, `movimento_vendas`, `descricao_produtos`) VALUES
(2, '22/02/25', '98888-8888', 'Distribuidora Y', 'Médio', 'Cadeira'),
(3, '25/02/25', '97777-7777', 'Distribuidora Z', 'Baixo', 'Mesa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `salario_fornecedor` varchar(10) DEFAULT NULL,
  `nome_fornecedor` varchar(45) DEFAULT NULL,
  `ctt_fornecedor` varchar(9) DEFAULT NULL,
  `tipo_produto` varchar(45) DEFAULT NULL,
  `email_fornecedor` varchar(45) DEFAULT NULL,
  `cliente_cpf_cliente` int(11) DEFAULT NULL,
  `cliente_produto_cod_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(45) NOT NULL,
  `salario` varchar(10) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `cpf_funcionario` varchar(15) NOT NULL,
  `idade_funcionario` varchar(2) NOT NULL,
  `cliente_cpf_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `loja`
--

DROP TABLE IF EXISTS `loja`;
CREATE TABLE `loja` (
  `cod_loja` int(11) NOT NULL,
  `contato_loja` varchar(15) NOT NULL,
  `email_loja` varchar(45) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `dono_loja` varchar(45) NOT NULL,
  `registro` varchar(45) NOT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `funcionario_id_funcionario` int(11) DEFAULT NULL,
  `fornecedor_id_fornecedor` int(11) DEFAULT NULL,
  `fornecedor_cliente_cpf_cliente` int(11) DEFAULT NULL,
  `fornecedor_cliente_produto_cod_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL,
  `quantidade` varchar(45) NOT NULL,
  `largura` varchar(15) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `altura` varchar(15) NOT NULL,
  `distribuidora_id_distribuidora` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf_cliente`),
  ADD KEY `produto_cod_produto` (`produto_cod_produto`);

--
-- Índices de tabela `distribuidora`
--
ALTER TABLE `distribuidora`
  ADD PRIMARY KEY (`id_distribuidora`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD KEY `cliente_cpf_cliente` (`cliente_cpf_cliente`),
  ADD KEY `cliente_produto_cod_produto` (`cliente_produto_cod_produto`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `cliente_cpf_cliente` (`cliente_cpf_cliente`);

--
-- Índices de tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`cod_loja`),
  ADD KEY `funcionario_id_funcionario` (`funcionario_id_funcionario`),
  ADD KEY `fornecedor_id_fornecedor` (`fornecedor_id_fornecedor`),
  ADD KEY `fornecedor_cliente_cpf_cliente` (`fornecedor_cliente_cpf_cliente`),
  ADD KEY `fornecedor_cliente_produto_cod_produto` (`fornecedor_cliente_produto_cod_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`),
  ADD KEY `distribuidora_id_distribuidora` (`distribuidora_id_distribuidora`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `distribuidora`
--
ALTER TABLE `distribuidora`
  MODIFY `id_distribuidora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`produto_cod_produto`) REFERENCES `produto` (`cod_produto`);

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`cliente_cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`),
  ADD CONSTRAINT `fornecedor_ibfk_2` FOREIGN KEY (`cliente_produto_cod_produto`) REFERENCES `cliente` (`produto_cod_produto`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cliente_cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`);

--
-- Restrições para tabelas `loja`
--
ALTER TABLE `loja`
  ADD CONSTRAINT `loja_ibfk_1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `loja_ibfk_2` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  ADD CONSTRAINT `loja_ibfk_3` FOREIGN KEY (`fornecedor_cliente_cpf_cliente`) REFERENCES `funcionario` (`cliente_cpf_cliente`),
  ADD CONSTRAINT `loja_ibfk_4` FOREIGN KEY (`fornecedor_cliente_produto_cod_produto`) REFERENCES `fornecedor` (`cliente_produto_cod_produto`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`distribuidora_id_distribuidora`) REFERENCES `distribuidora` (`id_distribuidora`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
