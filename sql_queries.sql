create database bank_analysis;
use bank_analysis;
select * from cleaned_chase;

-- show first 10 rows just to check data

select * from cleaned_chase
limit 10;

-- show only few columns
select  `Branch Name`,city,state,`Total Deposits` from cleaned_chase;

-- Find total number of branches
select state,count(*) as total_branches
from cleaned_chase
group by state;

-- find all unique stae

select distinct state
from cleaned_chase;

-- count how many brnahces in each state
select state ,count(*) as total_branches
from cleaned_chase
group by state
order by total_branches desc;

-- find the branch that has maximum growth
select 	`branch name` ,city,state,growth from cleaned_chase
order by growth desc limit 1;

-- find the branch that has minumum growth
select 	`branch name` ,city,state,growth from cleaned_chase
order by growth asc limit 1;

-- top 5 growing branches
select 	`branch name` ,city,state,growth from cleaned_chase
order by growth desc limit 5;

-- find states whose average total_deposit is greater than overall average depostis
select state,avg(`Total Deposits`) as tsales from cleaned_chase
group by state
having avg(`Total Deposits`)>(
select avg(tsales) from (select state,avg(`Total Deposits`)
 as tsales from cleaned_chase group by state
)t)
order by tsales desc limit 10;


-- find branches whose Total deposits are greater than average deposits of their own state
select `branch name`,state,`Total Deposits` from cleaned_chase  c1
where `Total Deposits` > (
select avg(`Total Deposits`) from cleaned_chase c2
where c1.state=c2.state
)













