use raj;

select * from sales_drop;

-- Year-over-Year (YoY) Analysis
with previous_year as
(select year, sum(amount) as current_year_amount, lag(sum(amount),1) over(order by year) as previous_year_amount
from sales_drop
group by year),
moving as
(select year, current_year_amount, previous_year_amount,
avg(current_year_amount) over(order by year rows between 1 preceding and current row) as moving_average
from previous_year),
drop_val as
(select year, current_year_amount, previous_year_amount,moving_average,
round(((current_year_amount - previous_year_amount) * 100)/ previous_year_amount, 0) as drop_rate
from moving)
select * from drop_val;

-- # Quarter-over-Quarter (QoQ) Analysis
with previous_quarter as
(select year, quarter, sum(amount) as current_quarter_amount, 
lag(sum(amount),1) over(order by year, quarter) as previous_quarter_amount
from sales_drop
group by year, quarter),
drop_val as
(select year, quarter, current_quarter_amount, previous_quarter_amount,
round(((current_quarter_amount - previous_quarter_amount) * 100)/ previous_quarter_amount, 0) as drop_rate
from previous_quarter)
select * from drop_val
order by drop_rate;

-- Region-wise quarterly drop
with previous_quarter as
(select year, quarter, regions, sum(amount) as current_quarter_r_amount, 
lag(sum(amount), 1) over(partition by regions order by year, quarter) as previous_quarter_r_amount
from sales_drop
group by regions, year, quarter),
drop_val as
(select year, quarter, regions, current_quarter_r_amount, previous_quarter_r_amount,
round(((current_quarter_r_amount - previous_quarter_r_amount) * 100)/ previous_quarter_r_amount, 0) as drop_rate
from previous_quarter)
select * from drop_val
where drop_rate is not null
order by drop_rate;

-- 
with previous_quarter as
(select year, quarter, product, sum(amount) as current_quarter_r_amount, 
lag(sum(amount), 1) over(partition by product order by year, quarter) as previous_quarter_r_amount
from sales_drop
group by product, year, quarter),
drop_val as
(select year, quarter, product, current_quarter_r_amount, previous_quarter_r_amount,
round(((current_quarter_r_amount - previous_quarter_r_amount) * 100)/ previous_quarter_r_amount, 0) as drop_rate
from previous_quarter)
select * from drop_val
where drop_rate is not null
order by drop_rate;


-- Final Root Cause of Sales Drop Quarterly-Wise
with previous_quarter as
(select regions, product, sales_reps, year, quarter, sum(amount) as amount,
lag(sum(amount), 1) over(partition by regions, product, sales_reps order by year, quarter) as previous_amount
from sales_drop
group by regions, product, sales_reps, year, quarter),
drop_val as
(select regions, product, sales_reps, year, quarter, amount, previous_amount,
(amount - previous_amount) as change_amount,
round(((amount - previous_amount) * 100) / previous_amount, 0) as percentage
from previous_quarter)
select * from drop_val
where percentage < 0
order by percentage;





