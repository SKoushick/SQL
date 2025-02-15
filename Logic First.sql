/*
Multiline comment
Character - CHAR ,VARCHAR ,TEXT (This is used when the length of the text is longer than expected), BLOB (Binary large object File = This is used to store the data of a image into binary format)
Numeric -  INT ,DECIMAL  ,FLOAT ,DOUBLE*/

show databases;
drop schema LogicFirst;
drop schema if exists LogicFirst;


use LogicFirst;

create table student(
student_id int primary key,
name varchar(40),
gpa decimal(3,2)
);
describe student;
alter table student add department Varchar(10);
alter table student drop depatment;
/*Also we can do this
*/
alter table student drop column department;

insert into student values(1,'kousi',8.1);
insert into student values(2,'mani',8.6);
insert into student values(3,'sam',8.0);

insert into student values(4,'pavi',8.3),
(5,'gayathri',9.0),
(6,'anjali',9.0);

insert into student(student_id,name) values(7,'jothi');
select name,gpa from student where gpa>=8.0;

select * from student where name<>'kousi';

select * from student;

create table employee(emp_id int,ename varchar(20), job_det varchar(20),salary int);
insert into employee(emp_id,ename,job_det,salary) values(1,'Ram','ADMIN',200000),
(2,'Harini','MANAGER',250000),
(3,'George','SALES',200000),
(4,'Ramya','SALES',130000),
(5,'Meena','HR',200000),
(6,'Ashok','MANAGER',300000),
(7,'Abdul','HR',210000),
(8,'Ramya','ENGINEER',100000),
(9,'Raghu','CEO',800000),
(10,'Arvind','MANAGER',280000),
(11,'Akshay','ENGINEER',100000),
(12,'john','ADMIN',220000),
(13,'Abinaya','ENGINEER',230000);

select * from employee;
select * from employee where ename='Ramya';

select * from employee where ename<>'Ramya';
select * from employee where salary>200000;

/*AND ,OR ,IN ,NOT IN*/
select * from employee where salary>200000 and salary<300000;



select * from employee where job_det='HR' or job_det='SALES';

select * from employee where job_det in ('HR','SALES','MANAGER')
limit 5;

select * from employee where job_det not in('CEO','MANAGER');
 
select * from employee limit 5;
/* LIKE */
select * from employee where ename like 'a%';
 
select * from employee where ename like 'a%a';

select * from employee where ename like '%z%';

select * from employee where ename like '%i%';

select * from employee where ename like '__i%';

select * from employee where ename like '\%';

/*
update and delete
*/

update employee SET job_det='ANALYST' where job_det = 'ENGINEER';
select * from employee;

select ename from employee;

select job_det from employee;

select ename from employee limit 5;
/*
UNIQUE 
*/
select distinct job_det from employee;

/*
ORDER BY
*/

select * from employee order by ename;

select * from employee order by job_det;

select * from employee order by salary desc;

select * from employee order by salary,ename;

select * from employee where job_det='MANAGER' order by salary;

select * from employee order by (case job_det
when 'CEO' then 1 
when 'MANAGER' then 2
when 'HR' then 3
when 'ANALYST' then 4
when 'SALES' then 5
else 100 end
);
