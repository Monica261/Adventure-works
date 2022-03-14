/*Views - tabelas dinamicas vistuais criadas a partir de uma consulta sql*/

/*View - professor, curso e disciplina*/
create view vw_rel_disc_curso_professor as
select
	p.idprofessor,
    p.nome,
    concat(c.idcurso,' - ', c.descricao) as 'id e descrição do curso',
    d.carga_horaria,
    d.fk_idprofessor
from
	curso as c
inner join disciplina as d on c.idcurso = c.idcurso
inner join professor as p on p.idprofessor = d.fk_idprofessor;

select *
from vw_rel_disc_curso_professor
where idprofessor = 140; -- chamar a view

select sum(carga_horaria) from vw_rel_disc_curso_professor; -- somar a carga horaria de todos os cursos


/*consultar, alterar e remover views*/

show create view universidade_u.vw_rel_disc_curso_professor;-- consultar o conteudo de uma view

alter view vw_rel_disc_curso_professor as -- alterar view
select
	p.idprofessor,
    p.nome,
    concat(c.idcurso,' - ', c.descricao) as 'id e descrição do curso',
    d.carga_horaria,
    d.fk_idprofessor,
    d.iddisciplina
from
	curso as c
inner join disciplina as d on c.idcurso = c.idcurso
inner join professor as p on p.idprofessor = d.fk_idprofessor;

drop view vw_rel_disc_curso_professor; -- apagar uma view