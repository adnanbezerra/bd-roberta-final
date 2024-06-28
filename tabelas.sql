BEGIN;

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
  semestre CHAR(2) NOT NULL,
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

INSERT INTO Professores (nome, email) VALUES
('João Silva', 'joao.silva@universidade.com'),
('Maria Santos', 'maria.santos@universidade.com'),
('Pedro Souza', 'pedro.souza@universidade.com');

INSERT INTO Turmas (semestre, ano) VALUES
('01', '2023'),
('02', '2023'),
('01', '2024'),
('02', '2024');

INSERT INTO Alunos (cpf, matricula, nome, endereco, telefone, programaDeFormacao, sexo) VALUES
('12345678901', 1001, 'Ana Oliveira', 'Rua A, 123', '98765432100', 'Graduacao', 'Feminino'),
('12345678902', 1002, 'Carlos Santos', 'Av. B, 456', '98765432101', 'Graduacao', 'Masculino'),
('12345678903', 1003, 'Julia Souza', 'Rua C, 789', '98765432102', 'Mestrado', 'Feminino'),
('12345678904', 1004, 'Mariana Lima', 'Av. D, 789', '98765432103', 'Graduacao', 'Feminino');

INSERT INTO AlunosNosCursos (aluno_cpf, cursoid) VALUES
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

INSERT INTO Disciplinas (nome, professorId, descricao, cargaHoraria, nivel, cursoid) VALUES
('Algoritmos', 1, 'Estudo de algoritmos computacionais', 60, 'Fundamental', 1),
('Banco de Dados', 2, 'Modelagem e administração de banco de dados', 80, 'Fundamental', 5),
('Redes de Computadores', 3, 'Princípios de redes de computadores', 70, 'Fundamental', 4),
('Inteligência Artificial', 1, 'Fundamentos de inteligência artificial', 75, 'Avançado', 6);

INSERT INTO DisciplinasNasTurmas (turmaId, disciplinaId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO AlunosNasTurmas (aluno_cpf, turmaId) VALUES
('12345678901', 1),
('12345678901', 2),
('12345678902', 3),
('12345678903', 4);

INSERT INTO Notas (aluno_cpf, disciplinaId, nota)
VALUES
('12345678901', 1, 9.0),
('12345678901', 2, 8.5),
('12345678902', 3, 7.0);

INSERT INTO DisciplinasCursadas (aluno_cpf, disciplinaId)
VALUES
('12345678901', 1),
('12345678901', 2),
('12345678902', 3);

COMMIT;
