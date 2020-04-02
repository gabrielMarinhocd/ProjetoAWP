-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Mar-2020 às 19:15
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `protecline`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `cpf_cnpj` varchar(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `situacao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `cpf_cnpj`, `nome`, `email`, `telefone`, `senha`, `celular`, `situacao`) VALUES
(1, '076.708.211.75', 'Gabriel Marinho', 'marinhoemail23@gmail.com', '(61) 3377-3467', '01', '(61) 9936-72608', 'ativo'),
(2, '012365478', 'Larissa Marinho dos Santos', 'larissamarinhodossantos@gmail.com', '(61) 3377-3467', '123456', '(61) 9999-99999', 'ativo'),
(12, '076.708.211-75', 'Gabriel Marinho', 'biel32771@gmail.com', '61993672608', '12GMdS12', '61993672608', 'ativo'),
(18, '00.000.000/0000-00', 'Gabriel Marinho', 'gabrielmarinhodossantoscd001@gmail.com', '61993672608', '01', '(01) 4684-78', 'ativo'),
(23, '076.708.211-76', 'Gabriel Marinho', 'biel327711@gmail.com', '61993672608', '', '61993672608', 'ativo'),
(24, '076.708.211-77', 'Gabriel Marinho', 'biel327712@gmail.com', '61993672608', '01', '61993672608', 'ativo'),
(25, '076.708.211-78', 'Gabriel Marinho', 'biel327718@gmail.com', '61993672608', '01', '61993672608', 'ativo'),
(27, '076.708.211-82', 'Gabriel Marinho', 'biel3277112@gmail.com', '61993672608', '01', '61993672608', 'ativo'),
(28, '', '', '', '', '', '', 'ativo'),
(33, '156.489.796-84', 'Gabriel Marinho', 'fdadsgs@gmail.com', '61993672608', '01', '61993672608', 'ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `situacao` varchar(25) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `login`, `senha`, `situacao`, `id_perfil`) VALUES
(3, 'admin', 'admin', '01', 'ativo', 1),
(4, 'Gerente', 'gerente', '01', 'ativo', 2),
(5, 'Funcionário', 'funcionario', '01', 'ativo', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id` bigint(20) NOT NULL,
  `fabricante` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `potencia` varchar(45) NOT NULL,
  `tensao_entrada` varchar(45) NOT NULL,
  `tensao_saida` varchar(45) NOT NULL,
  `numero_serie` varchar(255) NOT NULL,
  `problema` varchar(255) NOT NULL,
  `meio_pagamento` varchar(45) NOT NULL,
  `local` varchar(45) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `id_pedido` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id`, `fabricante`, `modelo`, `potencia`, `tensao_entrada`, `tensao_saida`, `numero_serie`, `problema`, `meio_pagamento`, `local`, `quantidade`, `id_pedido`) VALUES
(15, 'AWP', '5467489', '3200VA', '15w', '15w', '46987241', 'Não liga', 'Garantia - ups ', 'Loja - ups ', 0, 16),
(16, 'AWP', '5467489', '3200VA', '15w', '15w', '46987241', 'Não liga.', 'Garantia - ups ', 'Loja - ups ', 0, 17),
(17, 'AWP', '5467489', '3200VA', '15w', '15w', '46987241', 'Não liga.', 'Garantia - ups ', 'Loja - ups ', 0, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `local`
--

CREATE TABLE `local` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `situacao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `local`
--

INSERT INTO `local` (`id`, `nome`, `endereco`, `link`, `id_funcionario`, `situacao`) VALUES
(1, 'Loja - ups', 'Cruzeiro', 'www.upsquality.com.br', 4, 'ativo'),
(3, 'Teste4', 'Loja2', 'listar_cliente.jsp', 4, 'ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `material`
--

CREATE TABLE `material` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `material`
--

INSERT INTO `material` (`id`, `nome`, `quantidade`, `id_pedido`, `valor`) VALUES
(29, 'fonte', 1, 16, '12.50'),
(30, 'fonte', 1, 16, '12.50'),
(31, 'fonte', 1, 16, '12.50'),
(32, 'fonte', 1, 16, '12.50'),
(33, 'fonte', 1, 16, '12.50'),
(34, 'fonte', 3, 17, '10.30'),
(36, 'fonte', 3, 18, '12.50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `link`) VALUES
(1, 'Menu', 'listar_menu.jsp'),
(2, 'Perfil', 'listar_perfil.jsp'),
(3, 'Pedido', 'listar_pedido.jsp'),
(4, 'Funcionário', 'listar_funcionario.jsp'),
(5, 'Cliente', 'listar_cliente.jsp'),
(10, 'Gerenciar', 'gerenciamento.jsp'),
(11, 'Pedido', 'listar_pedido_gerente.jsp');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `aceito_valor` varchar(45) DEFAULT NULL,
  `situacao` varchar(45) DEFAULT NULL,
  `preco_final` varchar(255) DEFAULT NULL,
  `mao_obra` decimal(10,2) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `id_cliente`, `id_funcionario`, `data`, `status`, `data_pagamento`, `data_entrega`, `valor`, `aceito_valor`, `situacao`, `preco_final`, `mao_obra`, `descricao`) VALUES
(16, 1, 3, '2020-03-22', 'Finalizado', '2020-03-22', '2020-03-22', '60.50', 'aceito', 'Finalizado', '60.5', '10.50', NULL),
(17, 1, 3, '2020-03-22', 'Finalizado', '2020-03-22', '2020-03-22', '41.40', 'aceito', 'Finalizado', '41.4', '10.50', NULL),
(18, 1, NULL, '2020-03-23', 'Aguardando confirmação!', NULL, '2020-03-23', '48.00', NULL, NULL, '48.0', '10.50', 'Fonte estava queimada, foi necessÃ¡rio fazer a troca;');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'admin', 'admin'),
(2, 'Gerente', 'Gerente'),
(3, 'Funcionário', 'Funcionario');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `id_perfil` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`id_perfil`, `id_menu`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 10),
(1, 11),
(2, 4),
(2, 5),
(2, 10),
(2, 11),
(3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_atendimento`
--

CREATE TABLE `tipo_atendimento` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `situacao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_atendimento`
--

INSERT INTO `tipo_atendimento` (`id`, `nome`, `descricao`, `id_funcionario`, `situacao`) VALUES
(1, 'Garantia - ups', 'Garantia ', 4, 'ativo');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf_cnpj_UNIQUE` (`cpf_cnpj`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_perfil_idx` (`id_perfil`);

--
-- Índices para tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_pedido_pedido1_idx` (`id_pedido`);

--
-- Índices para tabela `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome`),
  ADD UNIQUE KEY `endereco_UNIQUE` (`endereco`),
  ADD KEY `fk_table1_funcionario1_idx` (`id_funcionario`);

--
-- Índices para tabela `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Material_pedido1_idx` (`id_pedido`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venda_cliente1_idx` (`id_cliente`),
  ADD KEY `fk_pedido_funcionario1_idx` (`id_funcionario`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD PRIMARY KEY (`id_perfil`,`id_menu`),
  ADD KEY `fk_perfil_has_menu_menu1_idx` (`id_menu`),
  ADD KEY `fk_perfil_has_menu_perfil1_idx` (`id_perfil`);

--
-- Índices para tabela `tipo_atendimento`
--
ALTER TABLE `tipo_atendimento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome`),
  ADD KEY `fk_tipo_atendimento_funcionario1_idx` (`id_funcionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `local`
--
ALTER TABLE `local`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `material`
--
ALTER TABLE `material`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_atendimento`
--
ALTER TABLE `tipo_atendimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`);

--
-- Limitadores para a tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `fk_item_pedido_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `fk_table1_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `fk_Material_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_perfil_has_menu_menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `fk_perfil_has_menu_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`);

--
-- Limitadores para a tabela `tipo_atendimento`
--
ALTER TABLE `tipo_atendimento`
  ADD CONSTRAINT `fk_tipo_atendimento_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
