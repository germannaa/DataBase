CREATE table empregado (
enome varchar(30) not null,
cpf int(11),
nasc date,
endereco varchar(50),
sexo character,
salario decimal(10,2) not null,
supervisor int, 
dept int,

primary key (cpf),
unique (cpf)
);

alter table empregado add 
foreign key (supervisor) references empregado(cpf);

alter table empregado add
foreign key (dept) references departamento (dnum);

CREATE TABLE departamento (
dnome varchar(30) not null,
dnum int, 
gerente int,
primary key (dnum),
foreign key (gerente) references empregado(cpf)
);



create table local_dept(
numdept int, 
localdept varchar(50),
primary key(numdept,localdept),
foreign key (numdept) references  departamento (dnum)
);

create table projeto(
pnome varchar(30),
pnum int,
plocal varchar(30),
numdept int,
primary key (pnum),
foreign key (numdept) references departamento(dnum)
);

create table trabalha_no (
emp int,
proj int,
horas varchar(10),
primary key (emp, proj),
foreign key (emp) references empregado(cpf),
foreign key (proj) references projeto (pnum)
);

create table dependentes (
emp int,
nomedepend varchar(50),
sexo character,
nasc date, 
parentesco varchar(10),
primary key (emp, nomedepend),
foreign key (emp) references  empregado(cpf)
);
