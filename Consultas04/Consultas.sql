UPDATE `aula15`.`empregado` SET `dept` = '2' WHERE (`cpf` = '333333333');
UPDATE `aula15`.`empregado` SET `dept` = '2' WHERE (`cpf` = '444444444');
UPDATE `aula15`.`empregado` SET `dept` = '2' WHERE (`cpf` = '654465465');


select *
from empregado
where dept = 02 and salario > 5000;


select enome
from empregado
where cpf in (select supervisor
from empregado where salario > 5000);

select e.enome, e.salario
from empregado as e
where e.salario > (select salario from empregado
where empregado.cpf = e.supervisor); 

select e.enome, p.pnome, d.dnome
from empregado as e, projeto as p, departamento as d
where p.numdept = d.dnum and d.gerente = e.cpf;

select p.pnome
from projeto as p
where pnum = (select trab.proj 
			from trabalha_no as trab 
			where trab.emp = (select cpf 	
								from empregado 
                                where enome = 'Joao Silva'));
                                
                                
select *
from empregado
where cpf not in (select emp
				from trabalha_no);
        
        
 select *
from empregado
where cpf in (select emp
				from trabalha_no);
        
        
select e.enome
from empregado as e
where not exists (select enome
from empregado
where e.cpf = cpf and cpf not in (select emp
				from trabalha_no)); 
        
        
