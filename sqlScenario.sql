use company 
go

SCENARIO BASED INTERVIEW ON WINDOW FUNCTION
===========================================
requirement
INPUT
============
INDIA
KENYA
AUSTRALIA
AFGHANISTAN

MAKE AMATCHING TABLE THAT NO TEAM WILL REPEAT LIKE
OUTPUT
===========================
  INDIA       KENYA
  INDIA       AUSTRALIA
  INDIA       AFGHANISTAN
  KENYA       AUSTRALIA
  KENYA       AFGHANISTAN
  AUSTRALIA   AFGHANISTAN
  

  
drop table if exists teams;
create table teams
(
team_name varchar(50)
);

insert into teams values('INDIA'),('KENYA'),('AUSTRALIA'),('AFGHANISTAN');

with cte as
(
select team_name, row_number() over(order by team_name) rn  
from teams
)

select * from cte T1, CTE T2 WHERE T1.RN<T2.RN;

select q1.team_name,q2.team_name from query q1,query q2 where q1.rn<q2.rn;

SCENARIO 2
==================================
ID      NAME        DEPT        MARKS
1       SUMESH      CSE          76
2       RAMESH      ECE          68
3       RAJ         CSE          61
4       ALOK        ECE          78
6       RANI        ECE          81
7       MUNNA       CSE          70
8       KAMAL       ECE          58
9       KRISHNA     CSE          82

CREATE TABLE MARKS
(
  ID INT,     
  NAME VARCHAR(50),        
  DEPT VARCHAR(10),        
  MARKS INT
);

TRUNCATE TABLE MARKS;

INSERT INTO MARKS VALUES(1,       'SUMESH',      'CSE',          76);
INSERT INTO MARKS VALUES(2,       'RAMESH',      'ECE',          68);
INSERT INTO MARKS VALUES(3,       'RAJ',         'CSE',          61);
INSERT INTO MARKS VALUES(4,       'ALOK',        'ECE',          78);
INSERT INTO MARKS VALUES(6,       'RANI',        'ECE',          81);
INSERT INTO MARKS VALUES(7,       'MUNNA',       'CSE',          70);
INSERT INTO MARKS VALUES(8,       'KAMAL',       'ECE',          58);
INSERT INTO MARKS VALUES(9,       'KRISHNA',     'CSE',          82);
INSERT INTO MARKS VALUES(10,	    'PANKAJ',		   'CSE',			     70);
INSERT INTO MARKS VALUES(11,	    'ARJUN',		   'ECE',			     58);

FIND THE RANKING OF STUDENT DEPT WISE
MARKS IN ASCENDING ORDER MEANS MIN MARKS TO MAX MARKS
GAP IN RANKS

SELECT *,RANK() OVER(PARTITION BY DEPT ORDER BY MARKS) RANK FROM MARKS; --HERE ORDER BY DEFAULT ASC

MARKS SHOULD BE IN DESC ORDER MINS MAX MARKS TO MIN MARKS
NO GAP IN RANK

SELECT *,DENSE_RANK() OVER(PARTITION BY DEPT ORDER BY MARKS DESC) RANK FROM MARKS;
