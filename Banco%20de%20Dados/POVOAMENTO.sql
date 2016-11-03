-- INSERT DE Tbl_ALUNOS
INSERT INTO Tbl_Alunos VALUES (31627052,31627052,'Izack G.Passos Rodrigues','M','1908/01/17','izackbh@gmail.com',NULL);
INSERT INTO Tbl_Alunos VALUES (30000001,30000001,'Donal D. Duck','M','1978/02/28','donald@dysney.com',NULL);
INSERT INTO Tbl_Alunos VALUES (30000003,30000003,'Rolando Lero','M','1966/04/01','rolanastrada@escolinha.com.br',NULL);
INSERT INTO Tbl_Alunos VALUES (30000004,30000004,'Dino Da Silva Sauro','M','0001/01/30','dino@saurus.com',NULL);
INSERT INTO Tbl_Alunos VALUES (30000005,30000005,'Scarlet Johanssen','F','1980/05/25','alinda@marvel.com',NULL);
INSERT INTO Tbl_Alunos VALUES (31611542,31611542,'Bruno Leone A.P. Correa','M','1997/05/08','leone.analistadesistemas@outlook.com.br',NULL);

-- INSERT DO Tbl_Professores
INSERT INTO Tbl_Professores VALUES (00000001,00000001,'Rodrigo','rodrigo@una.br','M');
INSERT INTO Tbl_Professores VALUES (00000002,00000002,'Alexandre','motanha@una.br','M');
INSERT INTO Tbl_Professores VALUES (00000003,00000003,'Flavio','flavio@una.br','M');
INSERT INTO Tbl_Professores VALUES (00000004,00000004,'Roberto','roberto@una.br','M');
INSERT INTO Tbl_Professores VALUES (00000005,00000005,'Fabricio','fabricio@una.br','M');

-- INSERT DE Tbl_Disciplinas
INSERT INTO Tbl_Disciplinas VALUES (1000,'Banco De Dados I');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Projeto PI');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Praticas Da Programaçao');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Fundamentos Da Programaçao');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Gerencia De Ti');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Segurança Da Informaçao');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Banco De Dados Ii');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Aplicações Web');
INSERT INTO Tbl_Disciplinas (NomeDisc) VALUES ('Engenharia De Software');

/* REVISÃO FEITA AQUI ATÉ AQUI */

-- INSERT DE CursoS
INSERT INTO Tbl_Cursos VALUES (1000,'SISTEMA DE INFORMAÇÕES','SI');
INSERT INTO Tbl_Cursos VALUES (,'ANALISE E DESENVOLVIMENTO DE SISTEMAS','ADS');
INSERT INTO Tbl_Cursos VALUES (,'CIÊNCIAS DA COMPUTAÇÃO','CP');

--INSERT DE SALAS
INSERT INTO Tbl_Salas VALUES (1000, 255);
INSERT INTO Tbl_Salas (Num) VALUES (256);
INSERT INTO Tbl_Salas (Num) VALUES (257);
INSERT INTO Tbl_Salas (Num) VALUES (258);
INSERT INTO Tbl_Salas (Num) VALUES (259);
INSERT INTO Tbl_Salas (Num) VALUES (260);
INSERT INTO Tbl_Salas (Num) VALUES (261);

--INSERT DE Tbl_Cursos POSSUI Tbl_Disciplinas
INSERT INTO Curso_possui_disc VALUES (default,002,0001);
INSERT INTO Curso_possui_disc VALUES (default,002,0002);
INSERT INTO Curso_possui_disc VALUES (default,002,0003);
INSERT INTO Curso_possui_disc VALUES (default,002,0004);
INSERT INTO Curso_possui_disc VALUES (default,002,0005);
INSERT INTO Curso_possui_disc VALUES (default,002,0006);
INSERT INTO Curso_possui_disc VALUES (default,002,0007);
INSERT INTO Curso_possui_disc VALUES (default,002,0008);
INSERT INTO Curso_possui_disc VALUES (default,002,0009);

INSERT INTO Curso_possui_disc VALUES (default,001,0001);
INSERT INTO Curso_possui_disc VALUES (default,001,0002);
INSERT INTO Curso_possui_disc VALUES (default,001,0003);
INSERT INTO Curso_possui_disc VALUES (default,001,0004);
INSERT INTO Curso_possui_disc VALUES (default,001,0005);
INSERT INTO Curso_possui_disc VALUES (default,001,0006);
INSERT INTO Curso_possui_disc VALUES (default,001,0007);
INSERT INTO Curso_possui_disc VALUES (default,001,0008);
INSERT INTO Curso_possui_disc VALUES (default,001,0009);

INSERT INTO Curso_possui_disc VALUES (default,003,0001);
INSERT INTO Curso_possui_disc VALUES (default,003,0002);
INSERT INTO Curso_possui_disc VALUES (default,003,0003);
INSERT INTO Curso_possui_disc VALUES (default,003,0004);
INSERT INTO Curso_possui_disc VALUES (default,003,0005);
INSERT INTO Curso_possui_disc VALUES (default,003,0006);
INSERT INTO Curso_possui_disc VALUES (default,003,0007);
INSERT INTO Curso_possui_disc VALUES (default,003,0008);
INSERT INTO Curso_possui_disc VALUES (default,003,0009);



-- UPDATE  Tbl_Alunos SET FAZ_Curso = 002 WHERE RA = 31627052;
-- UPDATE  Tbl_Alunos SET FAZ_Curso = 001 WHERE RA = 30000005;
-- UPDATE  Tbl_Alunos SET FAZ_Curso = 001 WHERE RA = 30000004;
-- UPDATE  Tbl_Alunos SET FAZ_Curso = 003 WHERE RA = 30000001;

select * from Tbl_Alunos
alter TABLE Tbl_Alunos DROP COLUMN DATA_AULA


select * from Codigos
INSERT INTO Codigos VALUES ('#15F287B',DEFAULT)

INSERT INTO AULA VALUES (DEFAULT,'#15F287B',31627052,00000005,9,0003,'2016/10/17')


INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,30000005,0007);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,30000005,0002);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,30000005,0001);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,30000005,0003);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,30000005,0005);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,30000005,0006);

INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,31627052,0001);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,31627052,0002);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,31627052,0003);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,31627052,0004);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,31627052,0005);
INSERT INTO Tbl_Aluno_faz_disc VALUES (DEFAULT,31627052,0007);

-- SELECT * FROM prof_ministra_Curso;
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000001,0001);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000001,0003);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000002,0002);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000002,0001);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000003,0002);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000004,0001);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000004,0003);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000004,0002);
INSERT INTO prof_ministra_Curso VALUES (DEFAULT,00000005,0001);



INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000001,0001);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000001,0007);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000002,0002);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000002,0006);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000003,0004);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000004,0004);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000004,0003);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000004,0006);
INSERT INTO prof_habilitado_disc VALUES (DEFAULT,00000005,0005);

INSERT INTO PROF_GERA_COD VALUES (DEFAULT,00000001,'#15F287B')