INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Gabinete');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Monitor');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Estabilizador');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Nobreak');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Mesa');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Cadeira');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Ar-condicionado');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Arm�rio');

INSERT INTO `restart`.`categoria` (`id`, `nome`) VALUES (NULL, 'Projetor');

INSERT INTO `restart`.`usuario` (`matricula`, `nome`, `sobrenome`, `email`, `senha`, `tipo_usuario`, `data_cadastro`, `data_atualizacao`, `telefone_residencial`, `telefone_celular`, `situacao`) VALUES ('2010', 'Sandra', 'Costa', 'sandracostaifs@gmail.com', '$2Cw51.ICu1Nw', '1', '2014-03-07 00:00:00', '2014-03-08 00:00:00', '(79) 9876-8349', '(79) 9876-8349', '1');


INSERT INTO `restart`.`usuario` (`matricula`, `nome`, `sobrenome`, `email`, `senha`, `tipo_usuario`, `data_cadastro`, `data_atualizacao`, `telefone_residencial`, `telefone_celular`, `situacao`) VALUES ('2011', 'Alexandre', '', '', '$2Cw51.ICu1Nw', '2', '2014-03-07 00:00:00', NULL, NULL, NULL, NULL);


INSERT INTO `restart`.`usuario` (`matricula`, `nome`, `sobrenome`, `email`, `senha`, `tipo_usuario`, `data_cadastro`, `data_atualizacao`, `telefone_residencial`, `telefone_celular`, `situacao`) VALUES ('2009', 'Marcelo', 'Machado', 'mcelobr@yahoo.com.br', '$2Cw51.ICu1Nw', '3', '2014-03-07 00:00:00', '2014-03-08 00:00:00', '(79) 3211-6754', '(79) 9987-6754', '1');


INSERT INTO `restart`.`usuario` (`matricula`, `nome`, `sobrenome`, `email`, `senha`, `tipo_usuario`, `data_cadastro`, `data_atualizacao`, `telefone_residencial`, `telefone_celular`, `situacao`) VALUES ('2008', 'M�rcio', NULL, NULL, '$2Cw51.ICu1Nw', '2', '2014-03-07 00:00:00', NULL, NULL, NULL, '1');



INSERT INTO `restart`.`imagem_hd` (`id`, `nome_arquivo`, `data_criacao`, `data_atualizacao`) VALUES (NULL, 'C:\\wamp\\www\\restart\\Imagem.gho', '2014-03-07 00:00:00', '2014-03-08 00:00:00');


INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 01');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 02');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 03');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 04');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 05');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 06');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 07');

INSERT INTO `restart`.`laboratorio` (`id`, `nome_laboratorio`) VALUES (NULL, 'Lab 08');


INSERT INTO `restart`.`patrimonio` (`num_patrimonio`, `num_posicionamento`, `situacao`, `data_cadastro`, `data_atualizacao`, `Laboratorio_id`, `Categoria_id`) VALUES ('123', '34', '1', '2014-03-07 00:00:00', '2014-03-08 00:00:00', '3', '1');


INSERT INTO `restart`.`patrimonio` (`num_patrimonio`, `num_posicionamento`, `situacao`, `data_cadastro`, `data_atualizacao`, `Laboratorio_id`, `Categoria_id`) VALUES ('456', '12', '1', '2014-03-07 00:00:00', NULL, '6', '4');

INSERT INTO `restart`.`configuracao` (`nome_db`, `servidor_smtp`, `porta_smtp`, `email_smtp`, `usuario_smtp`, `senha_smtp`, `seguranca_smtp`, `servidor_db`, `usuario_db`, `senha_db`) VALUES ('restart', 'smtp.gmail.com', '465', 'noreply.restart@gmail.com', 'noreply.restart@gmail.com', 'restart00', 'SSL', 'localhost', 'root', '');


INSERT INTO `restart`.`equipamento` (`id`, `modelo`, `modelo_processador`, `capacidade_ram`, `capacidade_hd`, `vencimento_garantia`, `Imagem_HD_id`, `Categoria_id`) VALUES (NULL, 'HP PROBOOK 6460B', 'INTEL CORE I7', '4 GB', '500 GB', '2014-03-31 00:00:00', '1', '1');


INSERT INTO `restart`.`software` (`id`, `nome`, `fabricante`, `versao`, `tipo_licenca`) VALUES (NULL, 'Windows', 'Microsoft', '7 Home Basic', '1');





