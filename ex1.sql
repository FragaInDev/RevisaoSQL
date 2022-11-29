USE revisao

CREATE TABLE aluno (
ra			CHAR(5)			NOT NULL,
nome		VARCHAR(255)	NOT NULL,
sobrenome	VARCHAR(255)	NOT NULL,
rua			VARCHAR(155)	NOT NULL,
numero		INT				NOT NULL,
bairro		VARCHAR(155)	NOT NULL,
cep			CHAR(8)			NOT NULL,
telefone	CHAR(8)			NULL
PRIMARY KEY (ra)
)

CREATE TABLE curso (
codigo			INT			NOT NULL,
nome			VARCHAR(55)	NOT NULL,
cargaHoraria	INT			NOT NULL,
turno			VARCHAR(10)	NOT NULL
PRIMARY KEY (codigo)
)

CREATE TABLE disciplina (
codigo			INT			NOT NULL,
nome			VARCHAR(60)	NOT NULL,
cargaHoraria	INT			NOT NULL,
turno			VARCHAR(10)	NOT NULL,
semestre		INT			NOT NULL
PRIMARY KEY (codigo)
)

/*Nome e sobrenome, como nome completo dos Alunos Matriculados*/
SELECT nome +' '+ sobrenome AS Nome_Completo
FROM aluno

/*Rua, nº , Bairro e CEP como Endereço do aluno que não tem telefone*/
SELECT nome +' '+ sobrenome AS Nome_Completo, rua+', '+CAST(numero AS varchar(30))+', '+bairro+', '+cep AS Endereco
FROM aluno
WHERE telefone = ' '

/*Telefone do aluno com RA 12348*/
SELECT telefone
FROM aluno
WHERE ra= '12348'

/*Nome e Turno dos cursos com 2800 horas*/
SELECT nome, turno
FROM curso
WHERE cargaHoraria = 2800

/*O semestre do curso de Banco de Dados I noite*/
SELECT semestre
FROM disciplina
WHERE nome LIKE 'Banco%'
	AND turno = 'Noite'
