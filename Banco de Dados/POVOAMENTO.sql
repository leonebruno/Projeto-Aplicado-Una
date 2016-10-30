-- INSERT DE ALUNOS
INSERT INTO Aluno VALUES (31627052,31627052,'Izack G.Passos Rodrigues','M','1908/01/17','izackbh@gmail.com',NULL);
INSERT INTO Aluno VALUES (30000001,30000001,'Donal D. Duck','M','1978/02/28','donald@dysney.com',NULL);
INSERT INTO Aluno VALUES (30000003,30000003,'Rolando Lero','M','1966/04/01','rolanastrada@escolinha.com.br',NULL);
INSERT INTO Aluno VALUES (30000004,30000004,'Dino Da Silva Sauro','M','0001/01/30','dino@saurus.com',NULL);
INSERT INTO Aluno VALUES (30000005,30000005,'Scarlet Johanssen','F','1980/05/25','alinda@marvel.com',NULL);
INSERT INTO Aluno VALUES (31611542,31611542,'Bruno Leone A.P. Correa','M','1997/05/08','leone.analistadesistemas@outlook.com.br',NULL);

-- INSERT DO Professor
INSERT INTO Professor VALUES (00000001,00000001,'Rodrigo','rodrigo@una.br','M');
INSERT INTO Professor VALUES (00000002,00000002,'Alexandre','motanha@una.br','M');
INSERT INTO Professor VALUES (00000003,00000003,'Flavio','flavio@una.br','M');
INSERT INTO Professor VALUES (00000004,00000004,'Roberto','roberto@una.br','M');
INSERT INTO Professor VALUES (00000005,00000005,'Fabricio','fabricio@una.br','M');

-- INSERT DE Disciplinas
INSERT INTO Disciplina VALUES (1000,'Banco De Dados I');
INSERT INTO Disciplina (NomeDisc) VALUES ('Projeto PI');
INSERT INTO Disciplina (NomeDisc) VALUES ('Praticas Da Programaçao');
INSERT INTO Disciplina (NomeDisc) VALUES ('Fundamentos Da Programaçao');
INSERT INTO Disciplina (NomeDisc) VALUES ('Gerencia De Ti');
INSERT INTO Disciplina (NomeDisc) VALUES ('Segurança Da Informaçao');
INSERT INTO Disciplina (NomeDisc) VALUES ('Banco De Dados Ii');
INSERT INTO Disciplina (NomeDisc) VALUES ('Aplicações Web');
INSERT INTO Disciplina (NomeDisc) VALUES ('Engenharia De Software');

/* REVISÃO FEITA AQUI ATÉ AQUI */

-- INSERT DE CursoS
INSERT INTO Curso VALUES (001,'SISTEMA DE INFORMAÇÕES','SI');
INSERT INTO Curso VALUES (002,'ANALISE E DESENVOLVIMENTO DE SISTEMAS','ADS');
INSERT INTO Curso VALUES (003,'CIÊNCIAS DA COMPUTAÇÃO','CP');

--INSERT DE Curso POSSUI Disciplina
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



-- UPDATE  Aluno SET FAZ_Curso = 002 WHERE RA = 31627052;
-- UPDATE  Aluno SET FAZ_Curso = 001 WHERE RA = 30000005;
-- UPDATE  Aluno SET FAZ_Curso = 001 WHERE RA = 30000004;
-- UPDATE  Aluno SET FAZ_Curso = 003 WHERE RA = 30000001;

select * from Aluno
alter TABLE Aluno DROP COLUMN DATA_AULA


select * from Codigos
INSERT INTO Codigos VALUES ('#15F287B',DEFAULT)

INSERT INTO AULA VALUES (DEFAULT,'#15F287B',31627052,00000005,9,0003,'2016/10/17')


INSERT INTO Aluno_faz_disc VALUES (DEFAULT,30000005,0007);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,30000005,0002);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,30000005,0001);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,30000005,0003);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,30000005,0005);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,30000005,0006);

INSERT INTO Aluno_faz_disc VALUES (DEFAULT,31627052,0001);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,31627052,0002);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,31627052,0003);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,31627052,0004);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,31627052,0005);
INSERT INTO Aluno_faz_disc VALUES (DEFAULT,31627052,0007);

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