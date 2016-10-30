use qrschool

SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM curso;
SELECT * FROM disciplina;
SELECT * FROM aula;
SELECT * FROM codigos;
SELECT * FROM aluno_faz_disc;
SELECT * FROM curso_possui_disc;
SELECT * FROM prof_gera_cod;
SELECT * FROM prof_habilitado_disc;
SELECT * FROM prof_ministra_curso;

select NOME,RA from aluno

-- CHECANDO REGISTRO DE PRESENÇA DOS ALUNOS ENTRE 16/10  E 24/10
SELECT AU.DATA_AULA DATA,A.RA,A.NOME,P.NOME,D.NOME_DISC,AU.COD_AULA
FROM ALUNO A JOIN AULA AU
ON A.RA = AU.PRES_ALUNO
JOIN professor P
ON P.REGIS_PROF = AU.PROF_RESP
JOIN disciplina D
ON AU.AULA_DISC = D.REGIS_DISC
WHERE AU.DATA_AULA between '2016/10/16' AND '2016/10/24'
order by AU.DATA_AULA

-- DISCIPLINAS QUE UM PROFESSOR ESTA HABILITADO A DAR
SELECT P.NOME,D.NOME_DISC
FROM PROFESSOR P JOIN PROF_HABILITADO_DISC HD
ON P.REGIS_PROF = HD.REGIS_PROF
JOIN DISCIPLINA D
ON D.REGIS_DISC = HD.REGIS_DISC

-- DISCIPLINAS CURSADAS CURSADAS POR UM ALUNO
SELECT A.NOME,D.NOME_DISC
FROM ALUNO A LEFT OUTER JOIN ALUNO_FAZ_DISC AD
ON A.RA = AD.RA
JOIN DISCIPLINA D
ON D.REGIS_DISC = AD.REGIS_DISC

-- VERIFICANDO QUAL CURSO UM PROFESSOR DÁ
SELECT C.NOME CURSO ,P.NOME PROFESSOR
FROM PROFESSOR P JOIN PROF_MINISTRA_CURSO PMC
ON P.REGIS_PROF = PMC.REGIS_PROF
JOIN CURSO C
ON C.REGIS_CURSO = PMC.REGIS_CURSO
ORDER BY C.NOME


-- VERIFICADO CÓDIGOS, O PROFESSOR QUE GEROU O CÓDIGO,A MATERIA E A DATA
SELECT A.COD_AULA CÓDIGO,P.NOME PROFESSOR,D.NOME_DISC MATÉRIA,A.DATA_AULA DATA
FROM PROFESSOR P JOIN PROF_GERA_COD PGC
ON P.REGIS_PROF = PGC.REGIS_PROF
JOIN AULA A
ON A.COD_AULA = PGC.COD_AULA
JOIN DISCIPLINA D
ON D.REGIS_DISC = A.AULA_DISC
GROUP BY A.COD_AULA
