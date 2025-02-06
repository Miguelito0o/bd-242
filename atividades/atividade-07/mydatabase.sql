-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 06/02/2025 às 01:21
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydatabase`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_COSTUMERS`
--

CREATE TABLE `TB_COSTUMERS` (
  `id` int NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` int NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postalCode` int NOT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int NOT NULL,
  `creditLimit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_COSTUMERS`
--

INSERT INTO `TB_COSTUMERS` (`id`, `customerName`, `contactLastName`, `contactFirstName`, `phone`, `addressLine1`, `addressLine2`, `city`, `state`, `postalCode`, `country`, `salesRepEmployeeNumber`, `creditLimit`) VALUES
(1, 'Miguel Ribeiro', 'Ribeiro', 'Miguel', 996924706, 'Rua Chico Lemos,1190', '---', 'Fortaleza', 'CE', 60971, 'Brasil', 1, 45000),
(3, 'Diana de Freitas', 'Freitas', 'Diana', 98205627, 'Rua Chico Lemos, 1190', '---', 'Fortaleza', 'CE', 60971, 'Brasil', 3, 50000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_EMPLOYEES`
--

CREATE TABLE `TB_EMPLOYEES` (
  `id` int NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `extension` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `officeCode` int NOT NULL,
  `reportsTo` varchar(50) NOT NULL,
  `jobTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_EMPLOYEES`
--

INSERT INTO `TB_EMPLOYEES` (`id`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`) VALUES
(1, 'Vieira', 'Sara', '---', 'saravieira.09@gmail.com', 1, 'desconhecido', 'Atendente'),
(2, 'Nogueira', 'Brenno', '---', 'brenno.nog07@gmail.com', 2, 'desconhecido', 'entregador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_OFFICES`
--

CREATE TABLE `TB_OFFICES` (
  `id` int NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` int NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` int NOT NULL,
  `territory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_OFFICES`
--

INSERT INTO `TB_OFFICES` (`id`, `city`, `phone`, `addressLine1`, `addressLine2`, `state`, `country`, `postalCode`, `territory`) VALUES
(1, 'Fortaleza', 19452867, 'Rua 8', '---', 'CE', 'Brasil', 60726, '---'),
(2, 'Caucaia', 975482, 'Rua H', '---', 'CE', 'Brasil', 40872, '---');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ORDERS`
--

CREATE TABLE `TB_ORDERS` (
  `id` int NOT NULL,
  `orderDate` int NOT NULL,
  `requiredDate` text NOT NULL,
  `shippedDate` text NOT NULL,
  `status` text NOT NULL,
  `comments` mediumtext NOT NULL,
  `customerNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_ORDERS`
--

INSERT INTO `TB_ORDERS` (`id`, `orderDate`, `requiredDate`, `shippedDate`, `status`, `comments`, `customerNumber`) VALUES
(1, 20250206, '06/02/25', '05/02/25', 'Em rota para entrega', '---', 1),
(2, 20250206, '10/02/25', '08/02/25', 'Em rota para Fortaleza', '---', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ORDER_TAILS`
--

CREATE TABLE `TB_ORDER_TAILS` (
  `id` int NOT NULL,
  `productCode_id` int NOT NULL,
  `quantityOrdered` int NOT NULL,
  `priceEach` int NOT NULL,
  `orderLineNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PAYMENTS`
--

CREATE TABLE `TB_PAYMENTS` (
  `checkNumber` int NOT NULL,
  `paymentDate` text NOT NULL,
  `amount` int NOT NULL,
  `custumerNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PAYMENTS`
--

INSERT INTO `TB_PAYMENTS` (`checkNumber`, `paymentDate`, `amount`, `custumerNumber`) VALUES
(1, '---', 170, 1),
(2, '---', 120, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUCTS`
--

CREATE TABLE `TB_PRODUCTS` (
  `id` int NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productLine_id` int NOT NULL,
  `productScale` int NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` varchar(140) NOT NULL,
  `quantityInStock` int NOT NULL,
  `buyPrice` int NOT NULL,
  `msrp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUCTS`
--

INSERT INTO `TB_PRODUCTS` (`id`, `productName`, `productLine_id`, `productScale`, `productVendor`, `productDescription`, `quantityInStock`, `buyPrice`, `msrp`) VALUES
(1, 'HD ', 3, 1, 'Intel', 'HD de armazenamento para computadores', 200, 65, 85),
(2, 'Caneta ', 4, 1, 'Bic', 'Caneta Bic de cores variadas ponta fina', 800, 1, 3),
(3, 'Sofá ', 5, 1, 'Sierra Móveis', 'Sofá grande confortável com 6 lugares.', 10, 5, 6),
(4, 'Jogo de Tabuleiro', 7, 1, 'Estrela', 'jogo de tabuleiro para se divertir com a família', 64, 45, 64),
(5, 'Sabonete Facial', 6, 1, 'Actine', 'Sabonete facial actine previne e clareia manchas de acnes deixando seu rosto livre de espinhas e cravos.', 300, 45, 60);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUCT_LINES`
--

CREATE TABLE `TB_PRODUCT_LINES` (
  `id` int NOT NULL,
  `textDescription` mediumtext NOT NULL,
  `htmlDescription` mediumtext NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUCT_LINES`
--

INSERT INTO `TB_PRODUCT_LINES` (`id`, `textDescription`, `htmlDescription`, `image`) VALUES
(3, 'Peças Eletrônicas', 'Peças eletrônicas para diversos aparelhos como celular, televisão, computador e etc.', ''),
(4, 'Materiais de Papelaria', 'Materiais de papelaria para se usar em seu escritório, escola ou no dia a dia.', ''),
(5, 'Móveis', 'Variedades de móveis para mobiliar a sua casa da melhor forma.', ''),
(6, 'Produtos de Higiene e Beleza', 'Produtos para cuidar de si de forma econômica e eficiente.', ''),
(7, 'Brinquedos', 'Brinquedos para crianças se divertirem.', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_COSTUMERS`
--
ALTER TABLE `TB_COSTUMERS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_EMPLOYEES`
--
ALTER TABLE `TB_EMPLOYEES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `officeCode` (`officeCode`);

--
-- Índices de tabela `TB_OFFICES`
--
ALTER TABLE `TB_OFFICES`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_ORDERS`
--
ALTER TABLE `TB_ORDERS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerNumber` (`customerNumber`);

--
-- Índices de tabela `TB_ORDER_TAILS`
--
ALTER TABLE `TB_ORDER_TAILS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productCode` (`productCode_id`);

--
-- Índices de tabela `TB_PAYMENTS`
--
ALTER TABLE `TB_PAYMENTS`
  ADD PRIMARY KEY (`checkNumber`),
  ADD KEY `custumerNumber` (`custumerNumber`);

--
-- Índices de tabela `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productLine` (`productLine_id`);

--
-- Índices de tabela `TB_PRODUCT_LINES`
--
ALTER TABLE `TB_PRODUCT_LINES`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_EMPLOYEES`
--
ALTER TABLE `TB_EMPLOYEES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TB_OFFICES`
--
ALTER TABLE `TB_OFFICES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TB_ORDERS`
--
ALTER TABLE `TB_ORDERS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TB_ORDER_TAILS`
--
ALTER TABLE `TB_ORDER_TAILS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TB_PAYMENTS`
--
ALTER TABLE `TB_PAYMENTS`
  MODIFY `checkNumber` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `TB_PRODUCT_LINES`
--
ALTER TABLE `TB_PRODUCT_LINES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_EMPLOYEES`
--
ALTER TABLE `TB_EMPLOYEES`
  ADD CONSTRAINT `TB_EMPLOYEES_ibfk_1` FOREIGN KEY (`officeCode`) REFERENCES `TB_OFFICES` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `TB_ORDERS`
--
ALTER TABLE `TB_ORDERS`
  ADD CONSTRAINT `TB_ORDERS_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `TB_COSTUMERS` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `TB_ORDER_TAILS`
--
ALTER TABLE `TB_ORDER_TAILS`
  ADD CONSTRAINT `TB_ORDER_TAILS_ibfk_1` FOREIGN KEY (`productCode_id`) REFERENCES `TB_PRODUCTS` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `TB_ORDER_TAILS_ibfk_2` FOREIGN KEY (`id`) REFERENCES `TB_ORDERS` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `TB_PAYMENTS`
--
ALTER TABLE `TB_PAYMENTS`
  ADD CONSTRAINT `TB_PAYMENTS_ibfk_1` FOREIGN KEY (`custumerNumber`) REFERENCES `TB_COSTUMERS` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `TB_PRODUCTS`
--
ALTER TABLE `TB_PRODUCTS`
  ADD CONSTRAINT `TB_PRODUCTS_ibfk_1` FOREIGN KEY (`productLine_id`) REFERENCES `TB_PRODUCT_LINES` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
