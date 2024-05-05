--Database creation of emp and dept tablein ms sql server
--create Dept table
create table dept
(
	DEPTNO   int primary key,
	DNAME    VARCHAR(14),
	LOC      VARCHAR(13)
)
go

--insert records in dept table
insert into dept values
(10,'ACCOUNTING',     'NEW YORK'),
(20, 'RESEARCH',       'DALLAS'),
(30, 'SALES',          'CHICAGO'),
(40, 'OPERATIONS',     'BOSTON')
go

--create Emp table
create table emp
(
	EMPNO    int primary key,
	ENAME    VARCHAR(10),
	JOB      VARCHAR(9),
	MGR      int references emp(empno),
	HIREDATE DATE,
	SAL      money,
	COMM     int,
	DEPTNO   int references dept(deptno)
)
go
--insert record in emp table
insert into emp values
(7839 ,'KING'   ,    'PRESIDENT' ,       null   , '17-NOV-81' ,      5000,        null   , 10),
(7698 ,'BLAKE'  ,    'MANAGER'   ,      7839, '01-MAY-81' ,      2850,        null   , 30),
(7782 ,'CLARK'  ,    'MANAGER'   ,      7839, '09-JUN-81' ,      2450,        null   , 10),
(7566 ,'JONES'  ,    'MANAGER'   ,      7839, '02-APR-81' ,      2975,        null   , 20),
(7654 ,'MARTIN' ,    'SALESMAN'  ,      7698, '28-SEP-81' ,      1250,       1400, 30),
(7499 ,'ALLEN'  ,    'SALESMAN'  ,      7698, '20-FEB-81' ,      1600,        300, 30),
(7844 ,'TURNER' ,    'SALESMAN'  ,      7698, '08-SEP-81' ,      1500,          0, 30),
(7900 ,'JAMES'  ,    'CLERK'     ,      7698, '03-DEC-81' ,       950,        null   , 30),
(7521 ,'WARD'   ,    'SALESMAN'  ,      7698, '22-FEB-81' ,      1250,        500, 30),
(7902 ,'FORD'   ,    'ANALYST'   ,      7566, '03-DEC-81' ,      3000,        null   , 20),
(7369 ,'SMITH'  ,    'CLERK'     ,      7902, '17-DEC-80' ,       800,        null   , 20),
(7788 ,'SCOTT'  ,    'ANALYST'   ,      7566, '09-DEC-82' ,      3000,        null   , 20),
(7876 ,'ADAMS'  ,    'CLERK'     ,      7788, '12-JAN-83' ,      1100,        null   , 20),
(7934 ,'MILLER' ,    'CLERK'     ,      7782, '23-JAN-82' ,      1300,        null   , 10)
go
--check the data in emp and dept table
select * from emp
go
select * from dept
go
