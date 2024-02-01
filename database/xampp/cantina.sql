-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Nov-2022 às 03:27
-- Versão do servidor: 8.0.28
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cantina`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carnes`
--

CREATE TABLE `carnes` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `carnes`
--

INSERT INTO `carnes` (`id`, `nome`) VALUES
(1, 'Francesinha'),
(2, 'Entremeada grelhada'),
(3, 'Frango'),
(4, 'Bife'),
(5, 'Borrego assado'),
(6, 'Rojões'),
(7, 'Lombo assado'),
(8, 'Arroz de pato'),
(9, 'Cabidela'),
(10, 'Cabrito no forno');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ementas`
--

CREATE TABLE `ementas` (
  `dia` int NOT NULL,
  `carne` int NOT NULL,
  `peixe` int NOT NULL,
  `vegetariano` int NOT NULL,
  `sopa` int NOT NULL,
  `sobremesa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `ementas`
--

INSERT INTO `ementas` (`dia`, `carne`, `peixe`, `vegetariano`, `sopa`, `sobremesa`) VALUES
(2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5),
(6, 6, 6, 6, 6, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `escolhas`
--

CREATE TABLE `escolhas` (
  `id` int NOT NULL,
  `numero` int NOT NULL,
  `dia` int NOT NULL,
  `prato` int NOT NULL,
  `sopa` int NOT NULL,
  `bebida` int NOT NULL,
  `sobremesa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `escolhas`
--

INSERT INTO `escolhas` (`id`, `numero`, `dia`, `prato`, `sopa`, `bebida`, `sobremesa`) VALUES
(7, 40358, 2, 1, 1, 2, 1),
(8, 43544, 3, 2, 0, 1, 0),
(9, 40358, 3, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `peixes`
--

CREATE TABLE `peixes` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `peixes`
--

INSERT INTO `peixes` (`id`, `nome`) VALUES
(1, 'Lulas'),
(2, 'Bacalhau'),
(3, 'Robalo'),
(4, 'Arroz de marisco'),
(5, 'Garoupa'),
(6, 'Polvo'),
(7, 'Caldeirada de peixe'),
(8, 'Sardinha assada'),
(9, 'Filete de espada'),
(10, 'Pescada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sobremesas`
--

CREATE TABLE `sobremesas` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `sobremesas`
--

INSERT INTO `sobremesas` (`id`, `nome`) VALUES
(0, 'Não'),
(1, 'Mousse de limão'),
(2, 'Fruta'),
(3, 'Gelatina'),
(4, 'Bolo de chocolate'),
(5, 'Arroz doce'),
(6, 'Aletria'),
(7, 'Pudim'),
(8, 'Mousse de chocolate'),
(9, 'Bolo de Cenoura'),
(10, 'Doce de leite');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sopas`
--

CREATE TABLE `sopas` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `sopas`
--

INSERT INTO `sopas` (`id`, `nome`) VALUES
(0, 'Não'),
(1, 'Legumes'),
(2, 'Cenoura'),
(3, 'Espinafre'),
(4, 'Batata'),
(5, 'Massa'),
(6, 'Abóbora'),
(7, 'Arroz'),
(8, 'Feijão'),
(9, 'Tomate'),
(10, 'Creme');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `numero` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `saldo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`numero`, `nome`, `tipo`, `saldo`) VALUES
(12029, 'Func1', 'Funcionário', 0),
(22476, 'Func2', 'Funcionário', 0),
(40358, 'Hugo Elias', 'Aluno', 30),
(43544, 'Vasco Edgar', 'Aluno', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vegetarianos`
--

CREATE TABLE `vegetarianos` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `vegetarianos`
--

INSERT INTO `vegetarianos` (`id`, `nome`) VALUES
(1, 'Pizza de cogumelos'),
(2, 'Arroz integral'),
(3, 'Torta de alho'),
(4, 'Pataniscas de alho'),
(5, 'Salteado de feijão'),
(6, 'Salada salteada'),
(7, 'Francesinha vegan'),
(8, 'Cozido vegetariano'),
(9, 'Arroz sem pato'),
(10, 'Alhada de tofu');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carnes`
--
ALTER TABLE `carnes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ementas`
--
ALTER TABLE `ementas`
  ADD PRIMARY KEY (`dia`),
  ADD KEY `carne` (`carne`),
  ADD KEY `peixe` (`peixe`),
  ADD KEY `vegetariano` (`vegetariano`),
  ADD KEY `sopa` (`sopa`),
  ADD KEY `sobremesa` (`sobremesa`);

--
-- Índices para tabela `escolhas`
--
ALTER TABLE `escolhas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero` (`numero`),
  ADD KEY `sopa` (`sopa`),
  ADD KEY `sobremesa` (`sobremesa`);

--
-- Índices para tabela `peixes`
--
ALTER TABLE `peixes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sobremesas`
--
ALTER TABLE `sobremesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sopas`
--
ALTER TABLE `sopas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`numero`);

--
-- Índices para tabela `vegetarianos`
--
ALTER TABLE `vegetarianos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carnes`
--
ALTER TABLE `carnes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `escolhas`
--
ALTER TABLE `escolhas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `peixes`
--
ALTER TABLE `peixes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `sobremesas`
--
ALTER TABLE `sobremesas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `sopas`
--
ALTER TABLE `sopas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `vegetarianos`
--
ALTER TABLE `vegetarianos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ementas`
--
ALTER TABLE `ementas`
  ADD CONSTRAINT `ementas_ibfk_1` FOREIGN KEY (`carne`) REFERENCES `carnes` (`id`),
  ADD CONSTRAINT `ementas_ibfk_2` FOREIGN KEY (`peixe`) REFERENCES `peixes` (`id`),
  ADD CONSTRAINT `ementas_ibfk_3` FOREIGN KEY (`vegetariano`) REFERENCES `vegetarianos` (`id`),
  ADD CONSTRAINT `ementas_ibfk_4` FOREIGN KEY (`sopa`) REFERENCES `sopas` (`id`),
  ADD CONSTRAINT `ementas_ibfk_5` FOREIGN KEY (`sobremesa`) REFERENCES `sobremesas` (`id`);

--
-- Limitadores para a tabela `escolhas`
--
ALTER TABLE `escolhas`
  ADD CONSTRAINT `escolhas_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `utilizadores` (`numero`),
  ADD CONSTRAINT `escolhas_ibfk_2` FOREIGN KEY (`sopa`) REFERENCES `sopas` (`id`),
  ADD CONSTRAINT `escolhas_ibfk_3` FOREIGN KEY (`sobremesa`) REFERENCES `sobremesas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
