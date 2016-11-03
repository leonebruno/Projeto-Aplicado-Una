CREATE DATABASE qrschool;
USE qrschool;

CREATE TABLE Tbl_Alunos(
	Ra INT NOT NULL,
	Senha VARCHAR(255) NOT NULL,
	Nome VARCHAR (40) NOT NULL,
	Sexo CHAR (1),
	DataNasc DATE,
	Email  VARCHAR (50),
	Uuid CHAR(50),
	CONSTRAINT PRIMARY KEY(Ra)
);

CREATE TABLE Tbl_Professores(
	CodProf INT NOT NULL,
	Senha VARCHAR(255) NOT NULL,
	Nome VARCHAR (100) NOT NULL,
	Email  VARCHAR(100),
	Sexo CHAR (1),
	CONSTRAINT PRIMARY KEY (CodProf)
);

CREATE TABLE Tbl_Disciplinas(
	CodDisc INT NOT NULL AUTO_INCREMENT,
	NomeDisc VARCHAR (100),
	CONSTRAINT PRIMARY KEY(CodDisc)
);

/*Feito*/

CREATE TABLE Tbl_Salas(
	CodSala INT NOT NULL AUTO_INCREMENT,
	Num INT NOT NULL,
    CONSTRAINT PRIMARY KEY(CodSala)
);

CREATE TABLE Tbl_Cursos(
	Regis_Curso INT NOT NULL,
	Nome VARCHAR(40),
	Sigla VARCHAR (4),
	CONSTRAINT PRIMARY KEY (Regis_Curso)
);


CREATE TABLE Tbl_Codigos(
	Num_Codigo VARCHAR(8),
	Data timestamp,
	CONSTRAINT PRIMARY KEY(Num_codigo)
);

CREATE TABLE Aula(
	Id_Aula INT NOT NULL AUTO_INCREMENT,
	Cod_Aula VARCHAR(8),
	Pres_Aluno INT,
	Prof_Resp INT,
	Nota_Aula INT,
	Aula_Disc INT,
	Data_Aula datetime,
	CONSTRAINT PRIMARY KEY (Id_aula),
	CONSTRAINT FOREIGN KEY FK_PreAlun(Pres_Aluno) REFERENCES Tbl_Alunos(Ra),
	constraint foreign key fk_CodCula(Cod_aula) references Tbl_Codigos(Num_codigo),
	CONSTRAINT FOREIGN KEY FK_ProfResp(Prof_Resp) REFERENCES Tbl_Professores(Regis_prof),
	CONSTRAINT FOREIGN KEY FK_AulaDisc(Aula_Disc) REFERENCES Tbl_Disciplinas (Regis_disc)
);


CREATE TABLE Aluno_Faz_Disc(
	Id_AlunoFazDisc INT NOT NULL AUTO_INCREMENT,
	Ra INT NOT NULL,
	Regis_disc INT NOT NULL,
	CONSTRAINT PRIMARY KEY(Id_AlunoFazDisc),
	CONSTRAINT FOREIGn KEY Fk_AlunoDISC(Ra) REFERENCES Tbl_Alunos(Ra),
	CONSTRAINT FOREIGN KEY Fk_DiscAluno(Regis_disc)REFERENCES Tbl_Disciplinas (Regis_disc)
);

CREATE TABLE PROF_HABILITADO_DISC(
	Id_ProfHabDisc INT NOT NULL AUTO_INCREMENT,
	Regis_Prof INT NOT NULL,
	Regis_Disc INT NOT NULL,
	CONSTRAINT PRIMARY KEY (Id_ProfHabDisc),
	CONSTRAINT FOREIGN KEY Fk_ProfDisc(Regis_prof) REFERENCES Tbl_Professores(Regis_prof),
	CONSTRAINT FOREIGN KEY Fk_DiscProf(Regis_disc) REFERENCES Tbl_Disciplinas(Regis_disc)
);


CREATE TABLE Prof_Ministra_Curso(
	Id_ProfMiniCurso INT NOT NULL AUTO_INCREMENT,
	Regis_Prof INT NOT NULL,
	Regis_Curso INT NOT NULL,
	CONSTRAINT PRIMARY KEY (Id_ProfMiniCurso),
	CONSTRAINT FOREIGN KEY FkCursoPRF(Regis_Curso) REFERENCES Tbl_Cursos(Regis_Curso),
	CONSTRAINT FOREIGN KEY FKPROFCUR(Regis_prof) REFERENCES Tbl_Professores (Regis_prof)
);

CREATE TABLE Prof_Gera_Cod(
	Id_ProfGeraC INT NOT NULL AUTO_INCREMENT,
	Regis_prof INT NOT NULL,
	Cod_aula VARCHAR (8) NOT NULL,
	CONSTRAINT PRIMARY KEY(ID_PROFGECOD),
	CONSTRAINT FOREIGN KEY FK_PROGC(Regis_prof) REFERENCES Tbl_Professores (Regis_prof),
	CONSTRAINT FOREIGN KEY FK_CGPRO(Cod_aula) REFERENCES AULA(Cod_aula)
);

CREATE TABLE Curso_POSSUI_DISC(
	Id_Curpodisc INT NOT NULL AUTO_INCREMENT,
	Regis_Curso INT NOT NULL,
	Regis_disc INT NOT NULL,
	CONSTRAINT PRIMARY KEY (Id_Curpodisc),
	CONSTRAINT FOREIGN KEY Fk_Curdisc(Regis_Curso) REFERENCES Tbl_Cursos(Regis_Curso),
	CONSTRAINT FOREIGN KEY Fk_Disccur(Regis_disc) REFERENCES Tbl_Disciplinas(Regis_disc)
);

-- (ALTER TABLE Tbl_Alunos ADD FAZ_Curso INT,
-- ALTER TABLE Tbl_Alunos ADD CONSTRAINT FOREIGN KEY FK_ALUFAZCurso (FAZ_Curso) REFERENCES Tbl_Cursos(Regis_Curso)
);

SELECT * FROM Tbl_Alunos;
SELECT * FROM Tbl_Professores;
SELECT * FROM Tbl_Cursos;
SELECT * FROM Tbl_Disciplinas;
SELECT * FROM aula;
SELECT * FROM Tbl_Codigos;
SELECT * FROM Aluno_faz_disc;
SELECT * FROM Curso_possui_disc;
SELECT * FROM prof_gera_cod;
SELECT * FROM prof_habilitado_disc;
SELECT * FROM prof_ministra_Curso;


SELECT A.RA,A.Nome,AU.DATA_AULA,P.Nome,D.Nome_DISC
FROM Tbl_Alunos A JOIN AULA AU
ON A.RA = AU.PRES_Aluno
JOIN Tbl_Professores P
ON P.Regis_prof = AU.PROF_RESP
JOIN Tbl_Disciplinas D
ON AU.AULA_DISC = D.Regis_disc
WHERE AU.DATA_AULA between '2016/10/16' AND '2016/10/24'
AND A.RA = 30000001
order by A.Nome


-- alter table Tbl_Professores add data_aula datetime;
-- alter table Tbl_Professores add constraint foreign key fk_deuauladia(data_aula) references aula(data_aula);

-- alter table Tbl_Alunos add data_aula datetime;
-- alter table Tbl_Alunos add constraint foreign key fk_teveauladia(data_aula) references aula(data_aula);

-- alter table Tbl_Disciplinas add data_aula datetime;
-- alter table Tbl_Disciplinas add constraint foreign key fk_aconteceudia(data_aula) references aula(data_aula);

-- alter table Tbl_Codigos add data_aula datetime;
-- alter table Tbl_Codigos add constraint foreign key fk_geroudia(data_aula) references aula(data_aula);



--create table sala(
-- cod_sala int not null AUTO_INCREMENT,
-- num_sala int,
-- constraint primary key(cod_sala)
--);