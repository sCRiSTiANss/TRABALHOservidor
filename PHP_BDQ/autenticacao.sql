-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:7306
-- Tempo de geração: 07/11/2024 às 18:31
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `autenticacao`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `codigos_redefinicao`
--

CREATE TABLE `codigos_redefinicao` (
  `usuario_id` int(11) NOT NULL,
  `codigo` varchar(6) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `codigos_verificacao`
--

CREATE TABLE `codigos_verificacao` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `questoes`
--

CREATE TABLE `questoes` (
  `id` int(11) NOT NULL,
  `enunciado` text NOT NULL,
  `alternativa1` varchar(255) NOT NULL,
  `alternativa2` varchar(255) NOT NULL,
  `alternativa3` varchar(255) NOT NULL,
  `alternativa4` varchar(255) NOT NULL,
  `alternativa5` varchar(255) NOT NULL,
  `alternativa_correta` int(11) NOT NULL,
  `assunto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `questoes`
--

INSERT INTO `questoes` (`id`, `enunciado`, `alternativa1`, `alternativa2`, `alternativa3`, `alternativa4`, `alternativa5`, `alternativa_correta`, `assunto`) VALUES
(1, 'Qual das operações de CRUD é usada para adicionar um novo registro ao banco de dados?', 'Atualizar', 'Excluir', 'Ler', 'Criar', 'Modificar', 4, 'PHP - CRUD'),
(2, 'Em um sistema CRUD, qual operação permite visualizar dados armazenados sem alterá-los?', 'Atualizar', 'Ler', 'Excluir', 'Criar', 'Modificar', 2, 'PHP - CRUD'),
(3, 'Qual é a função do comando SQL DELETE em operações CRUD?', 'Atualizar registros', 'Exibir registros', 'Deletar registros', 'Criar registros', 'Editar registros', 3, 'PHP - CRUD'),
(4, 'Qual das operações de CRUD geralmente envolve o uso do comando SQL UPDATE?', 'Ler', 'Excluir', 'Atualizar', 'Criar', 'Adicionar', 3, 'PHP - CRUD'),
(5, 'Qual é a principal função de session_start() em PHP?', 'Criar uma nova variável de sessão.', 'Iniciar uma nova sessão ou retomar uma sessão existente.', 'Enviar informações de sessão para o navegador.', 'Validar a autenticidade do usuário logado.', 'Enviar dados do servidor para o cliente.', 2, 'PHP_SESSION'),
(6, 'O que acontece se session_start() for chamado após enviar dados para o navegador em PHP?', 'A sessão será iniciada corretamente, sem problemas.', 'O PHP ignora a função session_start() e a sessão não é criada.', 'A sessão será criada, mas o navegador não receberá cookies.', 'Um erro será gerado e o script será interrompido.', 'O servidor automaticamente gera um novo cookie de sessão.', 4, 'PHP_SESSION');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `verificado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `codigos_redefinicao`
--
ALTER TABLE `codigos_redefinicao`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Índices de tabela `codigos_verificacao`
--
ALTER TABLE `codigos_verificacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `questoes`
--
ALTER TABLE `questoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `codigos_verificacao`
--
ALTER TABLE `codigos_verificacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questoes`
--
ALTER TABLE `questoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `codigos_redefinicao`
--
ALTER TABLE `codigos_redefinicao`
  ADD CONSTRAINT `codigos_redefinicao_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `codigos_verificacao`
--
ALTER TABLE `codigos_verificacao`
  ADD CONSTRAINT `codigos_verificacao_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
