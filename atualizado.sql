CREATE DATABASE Universidade;
USE Universidade;

CREATE TABLE Alunos (
  cpf CHAR(11) NOT NULL PRIMARY KEY, 
  matricula INT NOT NULL AUTO_INCREMENT UNIQUE, 
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(255),
  telefone CHAR(11), 
  programaDeFormacao ENUM('Graduacao', 'Mestrado', 'Doutorado') NOT NULL, 
  sexo ENUM('Masculino', 'Feminino')
);

CREATE TABLE Cursos (
  cursoId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40) NOT NULL,
  telefone VARCHAR(15) NOT NULL, 
  cargaHoraria INT NOT NULL
);

CREATE TABLE Professores (
  professorId INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  nome VARCHAR(40) NOT NULL, 
  email VARCHAR(50) NOT NULL
);

CREATE TABLE Turmas (
  turmaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  semestre CHAR(5) NOT NULL,
  ano CHAR(4) NOT NULL
);

-- Tabelas com dependências
CREATE TABLE AlunosNosCursos (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  aluno_cpf CHAR(11) NOT NULL, 
  cursoid INT NOT NULL,
  FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
  FOREIGN KEY (cursoid) REFERENCES Cursos(cursoid)
);

CREATE TABLE AlunosNasTurmas (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  aluno_cpf CHAR(11) NOT NULL, 
  turmaId INT NOT NULL,
  FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
  FOREIGN KEY (turmaId) REFERENCES Turmas(turmaId)
);

CREATE TABLE Disciplinas (
  disciplinaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL, 
  professorId INT NOT NULL,
  descricao VARCHAR(255) NOT NULL, 
  cargaHoraria INT NOT NULL,
  nivel VARCHAR(20) NOT NULL, 
  cursoid INT NOT NULL, 
  FOREIGN KEY (cursoid) REFERENCES Cursos(cursoid),
  FOREIGN KEY (professorId) REFERENCES Professores(professorId)
);

CREATE TABLE DisciplinasNasTurmas (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  turmaId INT NOT NULL,
  disciplinaId INT NOT NULL, 
  FOREIGN KEY (turmaId) REFERENCES Turmas(turmaId), 
  FOREIGN KEY (disciplinaId) REFERENCES Disciplinas(disciplinaId)
);

CREATE TABLE Notas (
  notaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  aluno_cpf CHAR(11) NOT NULL, 
  disciplinaId INT NOT NULL, 
  nota DECIMAL(4, 2) NOT NULL,
  FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
  FOREIGN KEY (disciplinaId) REFERENCES Disciplinas(disciplinaId)
);

CREATE TABLE DisciplinasCursadas ( 
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  aluno_cpf CHAR(11) NOT NULL, 
  disciplinaId INT NOT NULL, 
  FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
  FOREIGN KEY (disciplinaId) REFERENCES Disciplinas(disciplinaId)
);

INSERT INTO Cursos (nome, telefone, cargaHoraria) VALUES 
('Ciência da Computação', '11111111111', '3200'), 
('Engenharia de Software', '22222222222', '3200'), 
('Sistemas de Informação', '33333333333', '3200'), 
('Redes de Computadores', '44444444444', '2900'), 
('Banco de Dados', '55555555555', '3200'), 
('Inteligência Artificial', '66666666666', '2100'), 
('Desenvolvimento Web', '77777777777', '2200'), 
('Segurança da Informação', '88888888888', '3200'), 
('Computação Gráfica', '99999999999', '2400'), 
('Machine Learning', '10101010100', '2400');


INSERT INTO Professores (nome, email) VALUES ('Professor Ana Silva', 'prof.ana@examplel.com'), 
('Professor Brenda Almeida', 'prof.brenda@example.com'), 
('Professor Carlos Costa', 'prof.carlos@example.com'), 
('Professor Davi Farias', 'prof.davi@example.com'), 
('Professor Ester Correia', 'prof.ester@example.com'), 
('Professor Fernando Lima', 'prof.fernando@example.com'), 
('Professor Gabriela Bezerra', 'prof.gabriela@example.com'), 
('Professor Helena Ferreira', 'prof.helena@example.com'), 
('Professor Italo Lucena', 'prof.italo@example.com'), 
('Professor Julia Guimaraes', 'prof.julia@example.com'),
('Professor Karla Macedo', 'prof.karla@example.com'), 
('Professor Lucas Alves', 'prof.lucas@example.com'), 
('Professor Mariana Guedes', 'prof.mariana@example.com'), 
('Professor Natan Correia', 'prof.natan@example.com'), 
('Professor Olivia Campos', 'prof.olivia@example.com');

INSERT INTO Turmas (turmaId, semestre, ano) VALUES 
(1, '01', '2023'),
 (2, '02', '2023'),
 (3, '01', '2024'), 
(4, '02', '2024'), 
(5, '01', '2025');

INSERT INTO Alunos (cpf, matricula, nome, endereco, telefone, programaDeFormacao, sexo) VALUES 
('12345678901', NULL, 'João Silva', 'Rua A, 123', '11111111111', 'Graduacao', 'Masculino'),
('12345678902', NULL, 'Ana Oliveira', 'Rua D, 101', '44444444444', 'Graduacao', 'Feminino'),
('12345678903', NULL, 'Guilherme Lima', 'Rua I, 606', '99999999999', 'Doutorado', 'Masculino'),
('12345678904', NULL, 'Fernanda Santos', 'Rua J, 707', '10101010101', 'Graduacao', 'Feminino'),
('12345678905', NULL, 'Bruno Carvalho', 'Rua K, 808', '11111111112', 'Graduacao', 'Masculino'),
('12345678906', NULL, 'Larissa Martins', 'Rua L, 909', '22222222223', 'Mestrado', 'Feminino'),
('12345678907', NULL, 'Ricardo Azevedo', 'Rua M, 1010', '33333333334', 'Doutorado', 'Masculino'),
('12345678908', NULL, 'Beatriz Rodrigues', 'Rua N, 1111', '44444444445', 'Graduacao', 'Feminino'),
('12345678909', NULL, 'Felipe Moreira', 'Rua O, 1212', '55555555556', 'Mestrado', 'Masculino'),
('12345678910', NULL, 'Tatiana Mendes', 'Rua P, 1313', '66666666667', 'Doutorado', 'Feminino'),
('12345678911', NULL, 'Leonardo Nunes', 'Rua Q, 1414', '77777777778', 'Graduacao', 'Masculino'),
('12345678912', NULL, 'Camila Araújo', 'Rua R, 1515', '88888888889', 'Mestrado', 'Feminino'),
('12345678913', NULL, 'Diego Barros', 'Rua S, 1616', '99999999990', 'Doutorado', 'Masculino'),
('12345678914', NULL, 'Alice Correia', 'Rua T, 1717', '10101010102', 'Graduacao', 'Feminino'),
('12345678915', NULL, 'Marcelo Pinto', 'Rua U, 1818', '11111111113', 'Graduacao', 'Masculino'),
('12345678916', NULL, 'Patrícia Gomes', 'Rua V, 1919', '22222222224', 'Mestrado', 'Feminino'),
('12345678917', NULL, 'André Silva', 'Rua W, 2020', '33333333335', 'Doutorado', 'Masculino'),
('12345678918', NULL, 'Flávia Teixeira', 'Rua X, 2121', '44444444446', 'Graduacao', 'Feminino'),
('12345678919', NULL, 'Rodrigo Rocha', 'Rua Y, 2222', '55555555557', 'Mestrado', 'Masculino'),
('12345678920', NULL, 'Vanessa Santana', 'Rua Z, 2323', '66666666668', 'Doutorado', 'Feminino'),
('12345678921', NULL, 'Thiago Melo', 'Rua AA, 2424', '77777777779', 'Graduacao', 'Masculino'),
('12345678922', NULL, 'Mariana Cunha', 'Rua BB, 2525', '88888888890', 'Mestrado', 'Feminino'),
('12345678923', NULL, 'Vitor Sousa', 'Rua CC, 2626', '99999999991', 'Doutorado', 'Masculino'),
('12345678924', NULL, 'Luana Dias', 'Rua DD, 2727', '10101010103', 'Graduacao', 'Feminino'),
('12345678925', NULL, 'Renato Freitas', 'Rua EE, 2828', '11111111114', 'Graduacao', 'Masculino'),
('12345678926', NULL, 'Daniela Oliveira', 'Rua FF, 2929', '22222222225', 'Mestrado', 'Feminino'),
('12345678927', NULL, 'Eduardo Castro', 'Rua GG, 3030', '33333333336', 'Doutorado', 'Masculino'),
('12345678928', NULL, 'Juliana Fernandes', 'Rua HH, 3131', '44444444447', 'Graduacao', 'Feminino'),
('12345678929', NULL, 'Rafael Vieira', 'Rua II, 3232', '55555555558', 'Mestrado', 'Masculino'),
('12345678930', NULL, 'Letícia Brito', 'Rua JJ, 3333', '66666666669', 'Doutorado', 'Feminino'),
('12345678931', NULL, 'Gabriel Guedes', 'Rua KK, 3434', '77777777780', 'Graduacao', 'Masculino'),
('12345678932', NULL, 'Luisa Farias', 'Rua LL, 3535', '88888888891', 'Mestrado', 'Feminino'),
('12345678933', NULL, 'Mateus Ribeiro', 'Rua MM, 3636', '99999999992', 'Doutorado', 'Masculino'),
('12345678934', NULL, 'Sofia Ferreira', 'Rua NN, 3737', '10101010104', 'Graduacao', 'Feminino'),
('12345678935', NULL, 'José Lima', 'Rua OO, 3838', '11111111115', 'Graduacao', 'Masculino'),
('12345678936', NULL, 'Amanda Nascimento', 'Rua PP, 3939', '22222222226', 'Mestrado', 'Feminino'),
('12345678937', NULL, 'Fábio Duarte', 'Rua QQ, 4040', '33333333337', 'Doutorado', 'Masculino'),
('12345678938', NULL, 'Isabela Martins', 'Rua RR, 4141', '44444444448', 'Graduacao', 'Feminino'),
('12345678939', NULL, 'Rogério Silva', 'Rua SS, 4242', '55555555559', 'Mestrado', 'Masculino'),
('12345678940', NULL, 'Marta Albuquerque', 'Rua TT, 4343', '66666666670', 'Doutorado', 'Feminino'),
('12345678941', NULL, 'Alexandre Andrade', 'Rua UU, 4444', '77777777781', 'Graduacao', 'Masculino'),
('12345678942', NULL, 'Fernanda Matos', 'Rua VV, 4545', '88888888892', 'Mestrado', 'Feminino'),
('12345678943', NULL, 'Bruno Oliveira', 'Rua WW, 4646', '99999999993', 'Doutorado', 'Masculino'),
('12345678944', NULL, 'Paula Santos', 'Rua XX, 4747', '10101010105', 'Graduacao', 'Feminino'),
('12345678945', NULL, 'Daniel Costa', 'Rua YY, 4848', '11111111116', 'Graduacao', 'Masculino'),
('12345678946', NULL, 'Camila Mendes', 'Rua ZZ, 4949', '22222222227', 'Mestrado', 'Feminino'),
('12345678947', NULL, 'Felipe Albuquerque', 'Rua AAA, 5050', '33333333338', 'Doutorado', 'Masculino'),
('12345678948', NULL, 'Isabela Oliveira', 'Rua BBB, 5151', '44444444449', 'Graduacao', 'Feminino'),
('12345678949', NULL, 'Lucas Mendonça', 'Rua CCC, 5252', '55555555560', 'Mestrado', 'Masculino'),
('12345678950', NULL, 'Mariana Costa', 'Rua DDD, 5353', '66666666671', 'Doutorado', 'Feminino'),
('12345678951', NULL, 'Gustavo Almeida', 'Rua EEE, 5454', '77777777782', 'Graduacao', 'Masculino'),
('12345678952', NULL, 'Ana Paula Silva', 'Rua FFF, 5555', '88888888893', 'Mestrado', 'Feminino'),
('12345678953', NULL, 'Rafaela Santos', 'Rua GGG, 5656', '99999999994', 'Doutorado', 'Feminino'),
('12345678954', NULL, 'Felipe Oliveira', 'Rua HHH, 5757', '10101010106', 'Graduacao', 'Masculino'),
('12345678955', NULL, 'Aline Lima', 'Rua III, 5858', '11111111117', 'Graduacao', 'Feminino'),
('12345678956', NULL, 'Diego Pereira', 'Rua JJJ, 5959', '22222222228', 'Mestrado', 'Masculino'),
('12345678957', NULL, 'Marina Carvalho', 'Rua KKK, 6060', '33333333339', 'Doutorado', 'Feminino'),
('12345678958', NULL, 'Thiago Oliveira', 'Rua LLL, 6161', '44444444450', 'Graduacao', 'Masculino'),
('12345678959', NULL, 'Carla Fernandes', 'Rua MMM, 6262', '55555555561', 'Mestrado', 'Feminino'),
('12345678960', NULL, 'Rodrigo Sousa', 'Rua NNN, 6363', '66666666672', 'Doutorado', 'Masculino'),
('12345678961', NULL, 'Larissa Silva', 'Rua OOO, 6464', '77777777783', 'Graduacao', 'Feminino'),
('12345678962', NULL, 'Lucas Oliveira', 'Rua PPP, 6565', '88888888894', 'Mestrado', 'Masculino'),
('12345678963', NULL, 'Carolina Santos', 'Rua QQQ, 6666', '99999999995', 'Doutorado', 'Feminino'),
('12345678964', NULL, 'Rafael Lima', 'Rua RRR, 6767', '10101010107', 'Graduacao', 'Masculino'),
('12345678965', NULL, 'Patrícia Oliveira', 'Rua SSS, 6868', '11111111118', 'Graduacao', 'Feminino'),
('12345678966', NULL, 'Felipe Martins', 'Rua TTT, 6969', '22222222229', 'Mestrado', 'Masculino'),
('12345678967', NULL, 'Ana Carolina Silva', 'Rua UUU, 7070', '33333333340', 'Doutorado', 'Feminino'),
('12345678968', NULL, 'Guilherme Almeida', 'Rua VVV, 7171', '44444444451', 'Graduacao', 'Masculino'),
('12345678969', NULL, 'Juliana Costa', 'Rua WWW, 7272', '55555555562', 'Mestrado', 'Feminino'),
('12345678970', NULL, 'Gabriel Oliveira', 'Rua XXX, 7373', '66666666673', 'Doutorado', 'Masculino'),
('12345678971', NULL, 'Fernanda Alves', 'Rua YYY, 7474', '77777777784', 'Graduacao', 'Feminino'),
('12345678972', NULL, 'Ricardo Costa', 'Rua ZZZ, 7575', '88888888895', 'Mestrado', 'Masculino'),
('12345678973', NULL, 'Sandra Silva', 'Rua AAAA, 7676', '99999999996', 'Doutorado', 'Feminino'),
('12345678974', NULL, 'Marcos Santos', 'Rua BBBB, 7777', '10101010108', 'Graduacao', 'Masculino'),
('12345678975', NULL, 'Amanda Oliveira', 'Rua CCCC, 7878', '11111111119', 'Graduacao', 'Feminino'),
('12345678976', NULL, 'Rafaela Souza', 'Rua DDDD, 7979', '22222222230', 'Mestrado', 'Feminino'),
('12345678977', NULL, 'Rodrigo Almeida', 'Rua EEEE, 8080', '33333333341', 'Doutorado', 'Masculino'),
('12345678978', NULL, 'Luisa Costa', 'Rua FFFF, 8181', '44444444452', 'Graduacao', 'Feminino'),
('12345678979', NULL, 'Gabriel Silva', 'Rua GGGG, 8282', '55555555563', 'Mestrado', 'Masculino'),
('12345678980', NULL, 'Bruna Oliveira', 'Rua HHHH, 8383', '66666666674', 'Doutorado', 'Feminino'),
('12345678981', NULL, 'Matheus Santos', 'Rua IIII, 8484', '77777777785', 'Graduacao', 'Masculino'),
('12345678982', NULL, 'Camila Costa', 'Rua JJJJ, 8585', '88888888896', 'Mestrado', 'Feminino'),
('12345678983', NULL, 'Leonardo Oliveira', 'Rua KKKK, 8686', '99999999997', 'Doutorado', 'Masculino'),
('12345678984', NULL, 'Aline Ferreira', 'Rua LLLL, 8787', '10101010109', 'Graduacao', 'Feminino'),
('12345678985', NULL, 'Lucas Carvalho', 'Rua MMMM, 8888', '11111111120', 'Graduacao', 'Masculino'),
('12345678986', NULL, 'Juliana Almeida', 'Rua NNNN, 8989', '22222222231', 'Mestrado', 'Feminino'),
('12345678987', NULL, 'Thiago Santos', 'Rua OOOO, 9090', '33333333342', 'Doutorado', 'Masculino'),
('12345678988', NULL, 'Carolina Lima', 'Rua PPPP, 9191', '44444444453', 'Graduacao', 'Feminino'),
('12345678989', NULL, 'Felipe Pereira', 'Rua QQQQ, 9292', '55555555564', 'Mestrado', 'Masculino'),
('12345678990', NULL, 'Gabriela Almeida', 'Rua RRRR, 9393', '66666666675', 'Doutorado', 'Feminino'),
('12345678991', NULL, 'Matheus Oliveira', 'Rua SSSS, 9494', '77777777786', 'Graduacao', 'Masculino'),
('12345678992', NULL, 'Isabela Costa', 'Rua TTTT, 9595', '88888888897', 'Mestrado', 'Feminino'),
('12345678993', NULL, 'Renato Silva', 'Rua UUUU, 9696', '99999999998', 'Doutorado', 'Masculino'),
('12345678994', NULL, 'Ana Clara Santos', 'Rua VVVV, 9797', '10101010110', 'Graduacao', 'Feminino'),
('12345678995', NULL, 'Pedro Almeida', 'Rua WWWW, 9898', '11111111121', 'Graduacao', 'Masculino'),
('12345678996', NULL, 'Camila Oliveira', 'Rua XXXX, 9999', '22222222232', 'Mestrado', 'Feminino'),
('12345678997', NULL, 'Gustavo Santos', 'Rua YYYY, 10101', '33333333343', 'Doutorado', 'Masculino'),
('12345678998', NULL, 'Juliana Costa', 'Rua ZZZZ, 10202', '44444444454', 'Graduacao', 'Feminino'),
('12345678999', NULL, 'Rafael Oliveira', 'Rua AAAA, 10303', '55555555565', 'Mestrado', 'Masculino'),
('12345678000', NULL, 'Aline Santos', 'Rua BBBB, 10404', '66666666676', 'Doutorado', 'Feminino');

-- Inserção de dados na tabela AlunosNosCursos
INSERT INTO AlunosNosCursos (aluno_cpf, cursoId) VALUES 
('12345678901', '1'),
('12345678902', '2'),
('12345678903', '3'),
('12345678904', '4'),
('12345678905', '5'),
('12345678906', '6'),
('12345678907', '7'),
('12345678908', '8'),
('12345678909', '9'),
('12345678910', '10'),
('12345678911', '1'),
('12345678912', '2'),
('12345678913', '3'),
('12345678914', '4'),
('12345678915', '5'),
('12345678916', '6'),
('12345678917', '7'),
('12345678918', '8'),
('12345678919', '9'),
('12345678920', '10'),
('12345678921', '1'),
('12345678922', '2'),
('12345678923', '3'),
('12345678924', '4'),
('12345678925', '5'),
('12345678926', '6'),
('12345678927', '7'),
('12345678928', '8'),
('12345678929', '9'),
('12345678930', '10'),
('12345678931', '1'),
('12345678932', '2'),
('12345678933', '3'),
('12345678934', '4'),
('12345678935', '5'),
('12345678936', '6'),
('12345678937', '7'),
('12345678938', '8'),
('12345678939', '9'),
('12345678940', '10'),
('12345678941', '1'),
('12345678942', '2'),
('12345678943', '3'),
('12345678944', '4'),
('12345678945', '5'),
('12345678946', '6'),
('12345678947', '7'),
('12345678948', '8'),
('12345678949', '9'),
('12345678950', '10'),
('12345678951', '1'),
('12345678952', '2'),
('12345678953', '3'),
('12345678954', '4'),
('12345678955', '5'),
('12345678956', '6'),
('12345678957', '7'),
('12345678958', '8'),
('12345678959', '9'),
('12345678960', '10'),
('12345678961', '1'),
('12345678962', '2'),
('12345678963', '3'),
('12345678964', '4'),
('12345678965', '5'),
('12345678966', '6'),
('12345678967', '7'),
('12345678968', '8'),
('12345678969', '9'),
('12345678970', '10'),
('12345678971', '1'),
('12345678972', '2'),
('12345678973', '3'),
('12345678974', '4'),
('12345678975', '5'),
('12345678976', '6'),
('12345678977', '7'),
('12345678978', '8'),
('12345678979', '9'),
('12345678980', '10'),
('12345678981', '1'),
('12345678982', '2'),
('12345678983', '3'),
('12345678984', '4'),
('12345678985', '5'),
('12345678986', '6'),
('12345678987', '7'),
('12345678988', '8'),
('12345678989', '9'),
('12345678990', '10'),
('12345678991', '1'),
('12345678992', '2'),
('12345678993', '3'),
('12345678994', '4'),
('12345678995', '5'),
('12345678996', '6'),
('12345678997', '7'),
('12345678998', '8'),
('12345678999', '9'),
('12345678000', '10');


INSERT INTO Disciplinas (nome, descricao, cargaHoraria, nivel, cursoId, professorId) VALUES
 ('Lógica de Programação', 'Introdução à lógica de programação', 80, 'Básico', 1, 1), 
('Algoritmos e Estruturas de Dados', 'Estudo de algoritmos e estruturas de dados', 100, 'Intermediário', 1, 2), 
('Programação Orientada a Objetos',  'Conceitos de programação orientada a objetos', 90, 'Intermediário', 1, 3), 
('Banco de Dados',  'Fundamentos de bancos de dados', 100, 'Intermediário', 1, 4), 
('Redes de Computadores',  'Estudo de redes de computadores', 80, 'Básico', 1, 5), 
('Sistemas Operacionais',  'Funcionamento de sistemas operacionais', 100, 'Intermediário', 1, 6), 
('Engenharia de Software', 'Princípios de engenharia de software', 100, 'Avançado', 1, 7), 
('Desenvolvimento Web',  'Desenvolvimento de aplicações web', 80, 'Intermediário', 1, 8), 
('Inteligência Artificial', 'Fundamentos de inteligência artificial', 100, 'Avançado', 1, 9), 
('Segurança da Informação',  'Princípios de segurança da informação', 80, 'Intermediário', 1, 10), 
('Computação Gráfica',  'Técnicas de computação gráfica', 90, 'Avançado', 1, 11), 
('Big Data',  'Análise e processamento de grandes volumes de dados', 100, 'Avançado', 1, 12), 
('Machine Learning',  'Técnicas de aprendizado de máquina', 100, 'Avançado', 1, 13), 
('Internet das Coisas (IoT)',  'Conceitos e aplicações de IoT', 80, 'Intermediário', 1, 14), 
('Desenvolvimento Mobile',  'Desenvolvimento de aplicações móveis', 90, 'Intermediário', 1, 15), 
('Arquitetura de Computadores',  'Estudo da arquitetura de computadores', 100, 'Intermediário', 1, 1),
 ('Computação em Nuvem',  'Conceitos de computação em nuvem', 80, 'Intermediário', 1, 2), 
('Robótica',  'Princípios de robótica', 90, 'Avançado', 1, 3), 
('Visão Computacional', 'Técnicas de visão computacional', 100, 'Avançado', 1, 4), 
('Blockchain', 'Fundamentos de blockchain', 80, 'Intermediário', 1, 5);

-- DisciplinaNaTurma 
-- Turma 1
INSERT INTO DisciplinasNasTurmas (turmaId, disciplinaId) VALUES
(1, 11), (1, 12), (1, 13), (1, 14), (1, 15);

-- Turma 2
INSERT INTO DisciplinasNasTurmas (turmaId, disciplinaId) VALUES
(2, 11), (2, 12), (2, 13), (2, 14), (2, 15);

-- Turma 3
INSERT INTO DisciplinasNasTurmas (turmaId, disciplinaId) VALUES
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15);

-- Turma 4
INSERT INTO DisciplinasNasTurmas (turmaId, disciplinaId) VALUES
(4, 11), (4, 12), (4, 13), (4, 14), (4, 15);

-- Turma 5
INSERT INTO DisciplinasNasTurmas (turmaId, disciplinaId) VALUES
(5, 11), (5, 12), (5, 13), (5, 14), (5, 15);

-- Inserindo dados na tabela AlunosNaTurma
INSERT INTO AlunosNasTurmas (aluno_cpf, turmaId) VALUES
('12345678901', 1),
('12345678901', 2),
('12345678901', 3),
('12345678901', 4),
('12345678901', 5),
('12345678902', 1),
('12345678902', 2),
('12345678902', 3),
('12345678902', 4),
('12345678902', 5),
('12345678903', 1),
('12345678903', 2),
('12345678903', 3),
('12345678903', 4),
('12345678903', 5),
('12345678904', 1),
('12345678904', 2),
('12345678904', 3),
('12345678904', 4),
('12345678904', 5),
('12345678905', 1),
('12345678905', 2),
('12345678905', 3),
('12345678905', 4),
('12345678905', 5),
('12345678906', 1),
('12345678906', 2),
('12345678906', 3),
('12345678906', 4),
('12345678906', 5),
('12345678907', 1),
('12345678907', 2),
('12345678907', 3),
('12345678907', 4),
('12345678907', 5),
('12345678908', 1),
('12345678908', 2),
('12345678908', 3),
('12345678908', 4),
('12345678908', 5),
('12345678909', 1),
('12345678909', 2),
('12345678909', 3),
('12345678909', 4),
('12345678909', 5),
('12345678910', 1),
('12345678910', 2),
('12345678910', 3),
('12345678910', 4),
('12345678910', 5),
('12345678911', 1),
('12345678911', 2),
('12345678911', 3),
('12345678911', 4),
('12345678911', 5),
('12345678912', 1),
('12345678912', 2),
('12345678912', 3),
('12345678912', 4),
('12345678912', 5),
('12345678913', 1),
('12345678913', 2),
('12345678913', 3),
('12345678913', 4),
('12345678913', 5),
('12345678914', 1),
('12345678914', 2),
('12345678914', 3),
('12345678914', 4),
('12345678914', 5),
('12345678915', 1),
('12345678915', 2),
('12345678915', 3),
('12345678915', 4),
('12345678915', 5),
('12345678916', 1),
('12345678916', 2),
('12345678916', 3),
('12345678916', 4),
('12345678916', 5),
('12345678917', 1),
('12345678917', 2),
('12345678917', 3),
('12345678917', 4),
('12345678917', 5),
('12345678918', 1),
('12345678918', 2),
('12345678918', 3),
('12345678918', 4),
('12345678918', 5),
('12345678919', 1),
('12345678919', 2),
('12345678919', 3),
('12345678919', 4),
('12345678919', 5),
('12345678920', 1),
('12345678920', 2),
('12345678920', 3),
('12345678920', 4),
('12345678920', 5);

-- Continuar inserindo os demais alunos nas cinco primeiras turmas
INSERT INTO AlunosNasTurmas (aluno_cpf, turmaId) VALUES
('12345678921', 1),
('12345678921', 2),
('12345678921', 3),
('12345678921', 4),
('12345678921', 5),
('12345678922', 1),
('12345678922', 2),
('12345678922', 3),
('12345678922', 4),
('12345678922', 5),
('12345678923', 1),
('12345678923', 2),
('12345678923', 3),
('12345678923', 4),
('12345678923', 5),
('12345678924', 1),
('12345678924', 2),
('12345678924', 3),
('12345678924', 4),
('12345678924', 5),
('12345678925', 1),
('12345678925', 2),
('12345678925', 3),
('12345678925', 4),
('12345678925', 5),
('12345678926', 1),
('12345678926', 2),
('12345678926', 3),
('12345678926', 4),
('12345678926', 5),
('12345678927', 1),
('12345678927', 2),
('12345678927', 3),
('12345678927', 4),
('12345678927', 5),
('12345678928', 1),
('12345678928', 2),
('12345678928', 3),
('12345678928', 4),
('12345678928', 5),
('12345678929', 1),
('12345678929', 2),
('12345678929', 3),
('12345678929', 4),
('12345678929', 5),
('12345678930', 1),
('12345678930', 2),
('12345678930', 3),
('12345678930', 4),
('12345678930', 5);

-- Continuar inserindo os demais alunos nas cinco primeiras turmas
INSERT INTO AlunosNasTurmas (aluno_cpf, turmaId) VALUES
('12345678931', 1),
('12345678931', 2),
('12345678931', 3),
('12345678931', 4),
('12345678931', 5),
('12345678932', 1),
('12345678932', 2),
('12345678932', 3),
('12345678932', 4),
('12345678932', 5),
('12345678933', 1),
('12345678933', 2),
('12345678933', 3),
('12345678933', 4),
('12345678933', 5),
('12345678934', 1),
('12345678934', 2),
('12345678934', 3),
('12345678934', 4),
('12345678934', 5),
('12345678935', 1),
('12345678935', 2),
('12345678935', 3),
('12345678935', 4),
('12345678935', 5),
('12345678936', 1),
('12345678936', 2),
('12345678936', 3),
('12345678936', 4),
('12345678936', 5),
('12345678937', 1),
('12345678937', 2),
('12345678937', 3),
('12345678937', 4),
('12345678937', 5),
('12345678938', 1),
('12345678938', 2),
('12345678938', 3),
('12345678938', 4),
('12345678938', 5),
('12345678939', 1),
('12345678939', 2),
('12345678939', 3),
('12345678939', 4),
('12345678939', 5),
('12345678940', 1),
('12345678940', 2),
('12345678940', 3),
('12345678940', 4),
('12345678940', 5);













INSERT INTO Notas (aluno_cpf, disciplinaId, nota) VALUES
-- Notas para Aluno 1
('12345678901', 1, 8.5), ('12345678901', 2, 7.0), ('12345678901', 3, 6.5),
-- Notas para Aluno 2
('12345678902', 1, 9.0), ('12345678902', 2, 8.0), ('12345678902', 3, 7.5),
-- Notas para Aluno 3
('12345678903', 1, 7.0), ('12345678903', 2, 6.0), ('12345678903', 3, 8.0),
-- Notas para Aluno 4
('12345678904', 1, 8.0), ('12345678904', 2, 7.5), ('12345678904', 3, 9.0),
-- Notas para Aluno 5
('12345678905', 1, 7.5), ('12345678905', 2, 8.5), ('12345678905', 3, 6.0),
-- Notas para Aluno 6
('12345678906', 1, 9.5), ('12345678906', 2, 7.0), ('12345678906', 3, 8.0),
-- Notas para Aluno 7
('12345678907', 1, 6.5), ('12345678907', 2, 8.0), ('12345678907', 3, 7.5),
-- Notas para Aluno 8
('12345678908', 1, 8.0), ('12345678908', 2, 7.5), ('12345678908', 3, 8.5),
-- Notas para Aluno 9
('12345678909', 1, 7.0), ('12345678909', 2, 9.0), ('12345678909', 3, 6.5),
-- Notas para Aluno 10
('12345678910', 1, 8.5), ('12345678910', 2, 8.0), ('12345678910', 3, 7.0),
-- Notas para Aluno 11
('12345678911', 1, 9.0), ('12345678911', 2, 7.5), ('12345678911', 3, 8.0),
-- Notas para Aluno 12
('12345678912', 1, 8.0), ('12345678912', 2, 8.5), ('12345678912', 3, 7.0),
-- Notas para Aluno 13
('12345678913', 1, 7.5), ('12345678913', 2, 6.5), ('12345678913', 3, 8.5),
-- Notas para Aluno 14
('12345678914', 1, 8.5), ('12345678914', 2, 7.0), ('12345678914', 3, 8.0),
-- Notas para Aluno 15
('12345678915', 1, 9.0), ('12345678915', 2, 8.0), ('12345678915', 3, 7.5),
-- Notas para Aluno 16
('12345678916', 1, 8.0), ('12345678916', 2, 7.5), ('12345678916', 3, 8.0),
-- Notas para Aluno 17
('12345678917', 1, 7.5), ('12345678917', 2, 8.0), ('12345678917', 3, 7.0),
-- Notas para Aluno 18
('12345678918', 1, 8.5), ('12345678918', 2, 7.5), ('12345678918', 3, 9.0),
-- Notas para Aluno 19
('12345678919', 1, 9.0), ('12345678919', 2, 8.5), ('12345678919', 3, 8.0),
-- Notas para Aluno 20
('12345678920', 1, 7.0), ('12345678920', 2, 9.0), ('12345678920', 3, 7.5),
-- Notas para Aluno 21
('12345678921', 1, 8.0), ('12345678921', 2, 7.0), ('12345678921', 3, 8.5),
-- Notas para Aluno 22
('12345678922', 1, 9.0), ('12345678922', 2, 8.5), ('12345678922', 3, 7.0),
-- Notas para Aluno 23
('12345678923', 1, 7.5), ('12345678923', 2, 6.5), ('12345678923', 3, 8.0),
-- Notas para Aluno 24
('12345678924', 1, 8.5), ('12345678924', 2, 7.0), ('12345678924', 3, 8.0),
-- Notas para Aluno 25
('12345678925', 1, 9.0), ('12345678925', 2, 8.0), ('12345678925', 3, 7.5),
-- Notas para Aluno 26
('12345678926', 1, 8.0), ('12345678926', 2, 7.5), ('12345678926', 3, 8.0),
-- Notas para Aluno 27
('12345678927', 1, 7.5), ('12345678927', 2, 8.0), ('12345678927', 3, 7.0),
-- Notas para Aluno 28
('12345678928', 1, 8.5), ('12345678928', 2, 7.5), ('12345678928', 3, 9.0),
-- Notas para Aluno 29
('12345678929', 1, 9.0), ('12345678929', 2, 8.5), ('12345678929', 3, 8.0),
-- Notas para Aluno 30
('12345678930', 1, 7.0), ('12345678930', 2, 9.0), ('12345678930', 3, 7.5),
-- Notas para Aluno 31
('12345678931', 1, 8.0), ('12345678931', 2, 7.0), ('12345678931', 3, 8.5),
-- Notas para Aluno 32
('12345678932', 1, 9.0), ('12345678932', 2, 8.5), ('12345678932', 3, 7.0),
-- Notas para Aluno 33
('12345678933', 1, 7.5), ('12345678933', 2, 6.5), ('12345678933', 3, 8.5),
-- Notas para Aluno 34
('12345678934', 1, 8.5), ('12345678934', 2, 7.0), ('12345678934', 3, 8.0),
-- Notas para Aluno 35
('12345678935', 1, 9.0), ('12345678935', 2, 8.0), ('12345678935', 3, 7.5),
-- Notas para Aluno 36
('12345678936', 1, 8.0), ('12345678936', 2, 7.5), ('12345678936', 3, 8.0),
-- Notas para Aluno 37
('12345678937', 1, 7.5), ('12345678937', 2, 8.0), ('12345678937', 3, 7.0),
-- Notas para Aluno 38
('12345678938', 1, 8.5), ('12345678938', 2, 7.5), ('12345678938', 3, 9.0),
-- Notas para Aluno 39
('12345678939', 1, 9.0), ('12345678939', 2, 8.5), ('12345678939', 3, 8.0),
-- Notas para Aluno 40
('12345678940', 1, 7.0), ('12345678940', 2, 9.0), ('12345678940', 3, 7.5),
-- Notas para Aluno 41
('12345678941', 1, 8.0), ('12345678941', 2, 7.0), ('12345678941', 3, 8.5),
-- Notas para Aluno 42
('12345678942', 1, 9.0), ('12345678942', 2, 8.5), ('12345678942', 3, 7.0),
-- Notas para Aluno 43
('12345678943', 1, 7.5), ('12345678943', 2, 6.5), ('12345678943', 3, 8.0),
-- Notas para Aluno 44
('12345678944', 1, 8.5), ('12345678944', 2, 7.0), ('12345678944', 3, 8.0),
-- Notas para Aluno 45
('12345678945', 1, 9.0), ('12345678945', 2, 8.0), ('12345678945', 3, 7.5),
-- Notas para Aluno 46
('12345678946', 1, 8.0), ('12345678946', 2, 7.5), ('12345678946', 3, 8.0),
-- Notas para Aluno 47
('12345678947', 1, 7.5), ('12345678947', 2, 8.0), ('12345678947', 3, 7.0),
-- Notas para Aluno 48
('12345678948', 1, 8.5), ('12345678948', 2, 7.0), ('12345678948', 3, 8.0),
-- Notas para Aluno 49
('12345678949', 1, 7.0), ('12345678949', 2, 8.5), ('12345678949', 3, 7.5),
-- Notas para Aluno 50
('12345678950', 1, 9.0), ('12345678950', 2, 7.5), ('12345678950', 3, 8.0),
-- Notas para Aluno 51
('12345678951', 1, 8.0), ('12345678951', 2, 8.5), ('12345678951', 3, 7.0),
-- Notas para Aluno 52
('12345678952', 1, 7.5), ('12345678952', 2, 6.5), ('12345678952', 3, 8.5),
-- Notas para Aluno 53
('12345678953', 1, 8.5), ('12345678953', 2, 7.0), ('12345678953', 3, 8.0),
-- Notas para Aluno 54
('12345678954', 1, 9.0), ('12345678954', 2, 8.0), ('12345678954', 3, 7.5),
-- Notas para Aluno 55
('12345678955', 1, 8.0), ('12345678955', 2, 7.5), ('12345678955', 3, 8.0),
-- Notas para Aluno 56
('12345678956', 1, 7.5), ('12345678956', 2, 8.0), ('12345678956', 3, 7.0),
-- Notas para Aluno 57
('12345678957', 1, 8.5), ('12345678957', 2, 7.5), ('12345678957', 3, 9.0),
-- Notas para Aluno 58
('12345678958', 1, 9.0), ('12345678958', 2, 8.5), ('12345678958', 3, 8.0),
-- Notas para Aluno 59
('12345678959', 1, 7.0), ('12345678959', 2, 9.0), ('12345678959', 3, 7.5),
-- Notas para Aluno 60
('12345678960', 1, 8.0), ('12345678960', 2, 7.0), ('12345678960', 3, 8.5),
-- Notas para Aluno 61
('12345678961', 1, 9.0), ('12345678961', 2, 8.5), ('12345678961', 3, 7.0),
-- Notas para Aluno 62
('12345678962', 1, 7.5), ('12345678962', 2, 6.5), ('12345678962', 3, 8.0),
-- Notas para Aluno 63
('12345678963', 1, 8.5), ('12345678963', 2, 7.0), ('12345678963', 3, 8.0),
-- Notas para Aluno 64
('12345678964', 1, 9.0), ('12345678964', 2, 8.0), ('12345678964', 3, 7.5),
-- Notas para Aluno 65
('12345678965', 1, 8.0), ('12345678965', 2, 7.5), ('12345678965', 3, 8.0),
-- Notas para Aluno 66
('12345678966', 1, 7.5), ('12345678966', 2, 8.0), ('12345678966', 3, 7.0),
-- Notas para Aluno 67
('12345678967', 1, 8.5), ('12345678967', 2, 7.5), ('12345678967', 3, 9.0),
-- Notas para Aluno 68
('12345678968', 1, 9.0), ('12345678968', 2, 8.5), ('12345678968', 3, 8.0),
-- Notas para Aluno 69
('12345678969', 1, 7.0), ('12345678969', 2, 9.0), ('12345678969', 3, 7.5),
-- Notas para Aluno 70
('12345678970', 1, 8.0), ('12345678970', 2, 7.0), ('12345678970', 3, 8.5),
-- Notas para Aluno 71
('12345678971', 1, 9.0), ('12345678971', 2, 8.5), ('12345678971', 3, 7.0),
-- Notas para Aluno 72
('12345678972', 1, 7.5), ('12345678972', 2, 6.5), ('12345678972', 3, 8.0),
-- Notas para Aluno 73
('12345678973', 1, 8.5), ('12345678973', 2, 7.0), ('12345678973', 3, 8.0),
-- Notas para Aluno 74
('12345678974', 1, 9.0), ('12345678974', 2, 8.0), ('12345678974', 3, 7.5),
-- Notas para Aluno 75
('12345678975', 1, 8.0), ('12345678975', 2, 7.5), ('12345678975', 3, 8.0),
-- Notas para Aluno 76
('12345678976', 1, 7.5), ('12345678976', 2, 8.0), ('12345678976', 3, 7.0),
-- Notas para Aluno 77
('12345678977', 1, 8.5), ('12345678977', 2, 7.5), ('12345678977', 3, 9.0),
-- Notas para Aluno 78
('12345678978', 1, 9.0), ('12345678978', 2, 8.5), ('12345678978', 3, 8.0),
-- Notas para Aluno 79
('12345678979', 1, 7.0), ('12345678979', 2, 9.0), ('12345678979', 3, 7.5),
-- Notas para Aluno 80
('12345678980', 1, 8.0), ('12345678980', 2, 7.0), ('12345678980', 3, 8.5),
-- Notas para Aluno 81
('12345678981', 1, 9.0), ('12345678981', 2, 8.5), ('12345678981', 3, 7.0),
-- Notas para Aluno 82
('12345678982', 1, 7.5), ('12345678982', 2, 6.5), ('12345678982', 3, 8.0),
-- Notas para Aluno 83
('12345678983', 1, 8.5), ('12345678983', 2, 7.0), ('12345678983', 3, 8.0),
-- Notas para Aluno 84
('12345678984', 1, 9.0), ('12345678984', 2, 8.0), ('12345678984', 3, 7.5),
-- Notas para Aluno 85
('12345678985', 1, 8.0), ('12345678985', 2, 7.5), ('12345678985', 3, 8.0),
-- Notas para Aluno 86
('12345678986', 1, 7.5), ('12345678986', 2, 8.0), ('12345678986', 3, 7.0),
-- Notas para Aluno 87
('12345678987', 1, 8.5), ('12345678987', 2, 7.5), ('12345678987', 3, 9.0),
-- Notas para Aluno 88
('12345678988', 1, 9.0), ('12345678988', 2, 8.5), ('12345678988', 3, 8.0),
-- Notas para Aluno 89
('12345678989', 1, 7.0), ('12345678989', 2, 9.0), ('12345678989', 3, 7.5),
-- Notas para Aluno 90
('12345678990', 1, 8.0), ('12345678990', 2, 7.0), ('12345678990', 3, 8.5),
-- Notas para Aluno 91
('12345678991', 1, 9.0), ('12345678991', 2, 8.5), ('12345678991', 3, 7.0),
-- Notas para Aluno 92
('12345678992', 1, 7.5), ('12345678992', 2, 6.5), ('12345678992', 3, 8.0),
-- Notas para Aluno 93
('12345678993', 1, 8.5), ('12345678993', 2, 7.0), ('12345678993', 3, 8.0),
-- Notas para Aluno 94
('12345678994', 1, 9.0), ('12345678994', 2, 8.0), ('12345678994', 3, 7.5),
-- Notas para Aluno 95
('12345678995', 1, 8.0), ('12345678995', 2, 7.5), ('12345678995', 3, 8.0),
-- Notas para Aluno 96
('12345678996', 1, 7.5), ('12345678996', 2, 8.0), ('12345678996', 3, 7.0),
-- Notas para Aluno 97
('12345678997', 1, 8.5), ('12345678997', 2, 7.5), ('12345678997', 3, 9.0),
-- Notas para Aluno 98
('12345678998', 1, 9.0), ('12345678998', 2, 8.5), ('12345678998', 3, 8.0),
-- Notas para Aluno 99
('12345678999', 1, 7.0), ('12345678999', 2, 9.0), ('12345678999', 3, 7.5),
-- Notas para Aluno 100
('12345678000', 1, 8.0), ('12345678000', 2, 7.0), ('12345678000', 3, 8.5);



INSERT INTO DisciplinasCursadas (aluno_cpf, disciplinaId) VALUES 
('12345678901', 1),
('12345678901', 2),
 ('12345678901', 3), 
('12345678902', 4), 
('12345678902', 5), 
('12345678902', 6), 
('12345678903', 7), 
('12345678903', 8), 
('12345678903', 9),
 ('12345678904', 10);
 
 
 
SELECT nome, email FROM Professores;

-- QUESTÃO 2
SELECT nome, cargaHoraria from Disciplinas;

-- QUESTÃO 5

SELECT n.nota
FROM notas n
JOIN disciplinas d ON n.disciplinaId = d.disciplinaId
WHERE d.nome = 'Logica de programacao';

-- QUESTÃO 6

SELECT d.nome
FROM disciplinas d 
left join disciplinasCursadas dc ON dc.disciplinaId = d.disciplinaId
WHERE dc.disciplinaId is null;

-- QUESTÃO 9
SELECT Alunos.nome, Disciplinas.nome
FROM DisciplinasNasTurmas
JOIN Disciplinas ON DisciplinasNasTurmas.disciplinaId = Disciplinas.disciplinaId
JOIN Turmas ON DisciplinasNasTurmas.turmaId = Turmas.turmaId
JOIN AlunosNasTurmas ON Turmas.turmaId = AlunosNasTurmas.turmaId
JOIN Alunos ON AlunosNasTurmas.aluno_cpf = Alunos.cpf;

-- QUESTÃO 10
SELECT Disciplinas.nome AS disciplina, Professores.nome AS professor, COUNT(Alunos.cpf) AS numero_alunos
FROM Disciplinas JOIN Professores ON Disciplinas.professorId = Professores.professorId
JOIN DisciplinasNasTurmas ON Disciplinas.disciplinaId = DisciplinasNasTurmas.disciplinaId
JOIN AlunosNasTurmas ON DisciplinasNasTurmas.turmaId = AlunosNasTurmas.turmaId
JOIN Alunos ON AlunosNasTurmas.aluno_cpf = Alunos.cpf
GROUP BY Disciplinas.nome, Professores.nome
ORDER BY numero_alunos DESC
LIMIT 3;
 
 

