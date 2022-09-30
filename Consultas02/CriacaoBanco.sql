CREATE DATABASE empresa;

USE empresa;

CREATE TABLE `empresa`.`empregados` (
	`cpf` integer,
	`enome` varchar(60),
	`salario` float,
	`cpf_supervisor` integer,
	`dnumero` integer,
	PRIMARY KEY (`cpf`)
);

CREATE TABLE `empresa`.`departamentos` (
	`dnumero` integer,
	`dnome` varchar(60),
	`cpf_gerente` integer,
	PRIMARY KEY (`dnumero`),
	CONSTRAINT `fk_cpf` 
	FOREIGN KEY (`cpf_gerente` ) 
	REFERENCES `empresa`.`empregados`(`cpf`)	
);

CREATE TABLE `empresa`.`trabalha` (
	`cpf_emp` integer,
	`pnumero` integer,
	CONSTRAINT `fk_cpfemp` 
	FOREIGN KEY (`cpf_emp` )
	REFERENCES `empresa`.`empregados`(`cpf`)
);

CREATE TABLE `empresa`.`projetos` (
	`pnumero` integer,
	`pnome` varchar(45),
	`dnumero` integer,
	PRIMARY KEY(`pnumero`),
	CONSTRAINT `fk_dnum` 
	FOREIGN KEY (`dnumero`) 
	REFERENCES `empresa`.`departamentos`(`dnumero`)
);

Insert Into empregados
values (04938223,'João Silva', 2350, 243433, 1010);

Insert Into empregados(cpf, enome, salario, cpf_supervisor, dnumero)
values (58673392,'Mario Silveira', 3500, 243433, 1010);

Insert Into empregados(cpf, enome, salario, cpf_supervisor, dnumero)
values (111,'Daniel Teixeira', 3879, 04938223, 915);

Insert Into empregados
values (243433,'Aline Barros', 2350, NULL, 1010);

Insert Into departamentos (dnumero, dnome, cpf_gerente)
values (1010, 'Pesquisa', 04938223);

Insert Into departamentos (dnumero, dnome, cpf_gerente)
values (915, 'Computação', 111);

Insert Into departamentos
values (1020, 'Ensino', 243433);

Insert Into trabalha (cpf_emp, pnumero)
values (04938223, 2010);

Insert Into trabalha (cpf_emp, pnumero)
values (58673392, 2020);

Insert Into trabalha (cpf_emp, pnumero)
values (04938223, 2020);

Insert Into projetos (pnumero, pnome, dnumero)
values (2010,'Alpha', 1010);

Insert Into projetos (pnumero, pnome, dnumero)
values (2020,'Beta', 1020);

ALTER TABLE `empregados` ADD CONSTRAINT `fk_dnum2` FOREIGN KEY (`dnumero`) REFERENCES `empresa`.`departamentos`(`dnumero`);
ALTER TABLE `trabalha` ADD CONSTRAINT `fk_pnum` FOREIGN KEY (`pnumero`) REFERENCES `empresa`.`projetos`(`pnumero`);
