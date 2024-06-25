CREATE DATABASE Universidade;
USE Universidade;

CREATE TABLE Alunos (
  cpf VARCHAR(11) NOT NULL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone CHAR(20) NOT NULL,
  programaDeFormacao ENUM('Graduacao', 'Mestrado', 'Doutorado') NOT NULL
);

CREATE TABLE Cursos (
  cursoid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  telefone CHAR(20) NOT NULL
);

CREATE TABLE Turma (
  turmaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  semestre INT NOT NULL,
  ano INT NOT NULL
);

CREATE TABLE Disciplina (
  disciplinaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  cargaHoraria INT NOT NULL,
  nivel VARCHAR(255) NOT NULL,
  departamento VARCHAR(255) NOT NULL
);

CREATE TABLE Matricula (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  alunocpf VARCHAR(11) NOT NULL,
  cursoId INT NOT NULL,
  FOREIGN KEY (alunocpf) REFERENCES Alunos(cpf),
  FOREIGN KEY (cursoId) REFERENCES Cursos(cursoid)
);

CREATE TABLE AlunosNaTurma (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  aluno_cpf VARCHAR(11) NOT NULL,
  turma_id INT NOT NULL,
  FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf),
  FOREIGN KEY (turma_id) REFERENCES Turma(turmaId)
);

CREATE TABLE DisciplinaNaTurma (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  turma_id INT NOT NULL,
  disciplinaId INT NOT NULL,
  FOREIGN KEY (turma_id) REFERENCES Turma(turmaId),
  FOREIGN KEY (disciplinaId) REFERENCES Disciplina(disciplinaId)
);

-- CORREÇÃO QUE SE FEZ NECESSÁRIA NA ELABORAÇÃO DA FASE 1 DE NOSSO PROJETO --

CREATE TABLE Disciplina (
disciplinaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL, 
professor VARCHAR(40) NOT NULL, 
descricao VARCHAR(255) NOT NULL, 
cargaHoraria INT NOT NULL,
nivel VARCHAR(20) NOT NULL, 
cursoid INT NOT NULL, 
FOREIGN KEY (cursoid) REFERENCES Cursos(cursoid) );

CREATE TABLE AlunosNosCursos (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
aluno_cpf CHAR(11) NOT NULL, 
cursoid INT NOT NULL,
FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
FOREIGN KEY (cursoid) REFERENCES Cursos(cursoid) );

CREATE TABLE Professores (
professorId INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(40) NOT NULL, 
email VARCHAR(50) NOT NULL,
FOREIGN KEY (professorId) REFERENCES Professores(professorId) );

CREATE TABLE Notas (
notaId INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
aluno_cpf CHAR(11) NOT NULL, 
disciplinaId INT NOT NULL, nota DECIMAL(4, 2) NOT NULL,
FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
FOREIGN KEY (disciplinaId) REFERENCES Disciplina(disciplinaId) );

CREATE TABLE DisciplinasCursadas ( 
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
aluno_cpf CHAR(11) NOT NULL, 
disciplinaId INT NOT NULL, 
FOREIGN KEY (aluno_cpf) REFERENCES Alunos(cpf), 
FOREIGN KEY (disciplinaId) REFERENCES Disciplina(disciplinaId) );




