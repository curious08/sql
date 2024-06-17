use company 
go

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
