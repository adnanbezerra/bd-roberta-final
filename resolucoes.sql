-- QUESTÃO 1
SELECT nome, email FROM 'Professores';

-- QUESTÃO 2
SELECT nome, cargaHoraria from 'Disciplinas';

-- QUESTÃO 3

-- QUESTÃO 4

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

--QUESTÃO 7

--QUESTÃO 8

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
LIMIT 1;
