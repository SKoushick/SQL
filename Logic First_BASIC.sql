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



-- FUNCTIONS - performs a specific task
-- count function
select count(*) total_count from employee;

select count(*) Manager_count from employee where job_det = 'MANAGER';

-- AGGREGATE FUNCTION

-- Avg funciton
select avg(salary) from employee where job_det = 'MANAGER';

-- SUM function
select sum(salary) from employee where job_det='ANALYST';

-- Max funciotn
select max(salary) from employee;

-- Min funciotn
select min(salary) from employee;

-- String Function

-- UCASE
select ucase(ename) name,salary from employee;

-- CHAR_LENGTH
select ename,char_length(ename) char_count from employee;

-- CONCATE function
select ename,concat('Rs.',salary) from employee;

-- FORMAT function
select ename,concat('Rs.',format(salary,0)) from employee;

-- left function
select ename,left(job_det,3) from employee;




-- DATE 

alter table employee add column Hire_date date;

select * from employee;

update employee set Hire_date='2021-4-12';
update employee set Hire_date='2001-6-23' where job_det='ANALYST';
update employee set Hire_date='2006-3-17' where job_det='HR';
update employee set Hire_date='2000-1-10' where job_det='MANAGER';

select now();

select date(now());

select curdate();

select date_format(curdate(),'%d/%m/%y');
select date_format(curdate(),'%d/%m/%Y');

select date_format(curdate(),'%Y/%m/%d') as Date;

select datediff(curdate(),'2022/6/22') as Date_diff;

select date_add(curdate(),interval 1 day ) as Interval_1day;
select date_add(curdate(),interval 1 month ) as Interval_1month;
select date_add(curdate(),interval 1 year ) as Interval_1year;

select * from employee;

-- GROUP BY and having

select * from employee order by job_det;

select job_det,avg(salary) from employee group by job_det;

select job_det,count(salary) from employee group by job_det;

-- we cannot give the group by without any aggregate functions and without the aggregate funciotn this wont be relatable
-- this is the example for it
select job_det ,salary from employee group by job_det;

-- Having function

select job_det,count(emp_id) from employee group by job_det having count(emp_id)>1;

-- where filters rows
-- having filters group by

-- we can only give the order by at the last so  it will  be efficient 
select job_det,count(emp_id) from employee group by job_det having count(emp_id)>1 order by job_det; 

select job_det,count(emp_id) from employee group by job_det having count(emp_id)>1 order by job_det; 

select job_det,count(emp_id) from employee where salary>200000 group by job_det having count(emp_id)>1 order by job_det; 
