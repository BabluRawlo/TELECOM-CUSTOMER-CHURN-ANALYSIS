--CHURN OVERVIEW----

Q.1 what is the churn rate ?

select (count(case when customer_status ='churned' then 1 end)/count(*)) * 100 as churn_percent
from telecom_churn;
------------------------------------------------------------------------------------------------------------------------------------------
Q.2 % of churned by-customer status?

select customer_status,count(*) as customer_count,
(count(*)/(select count(*) from telecom_churn)) * 100 as percent
from telecom_churn
where customer_status = 'churned'
group by customer_status; 

-----------------------------------------------------------------------------------------------------------------------------
Q.3 churn rate by contract?

select contract,count(*)as customer,(count(*)/(select count(*) from telecom_churn)) * 100 as percent
from telecom_churn
where customer_status ='churned'
group by contract;
----------------------------------------------------------------------------------------------------------------------------------
Q.4 churn rate by payment method?

select payment_method ,count(*)as customer,(count(*)/(select count(*) from telecom_churn)) * 100 as percent
from telecom_churn
where customer_status ='churned'
group by payment_method;
----------------------------------------------------------------------------------------------------------------------------------------
Q.5 what is a total revenue?

select sum(Total_revenue) as revenue
from telecom_churn;

-----------------------------------------------------------------------------------------------------------------------------------------
Q.3 churn rate by city?

select city,count(*) as customer,(count(*)/(select count(*) from telecom_churn)) * 100 as Churn_percent
from telecom_churn
where customer_status = 'churned'
group by city
order by churn_percent desc
limit 5;
----------------------------------------------------------------------------------------------------------------------------------------------
Q.4 churn by curn category?

select churn_category,count(*) as customer,(count(*)/(select count(*) from telecom_churn)) * 100 as Churn_percent
from telecom_churn
where customer_status = 'churned'
group by churn_category
order by churn_percent desc
limit 5;
----------------------------------------------------------------------------------------------------------------------------------------------
Q.5  churn rate by gender ?

select gender,count(*) as customer,(count(*)/(select count(*) from telecom_churn)) * 100 as Churn_percent
from telecom_churn
where customer_status = 'churned'
group by gender
order by churn_percent desc
limit 5;
-------------------------------------------------------------------------------------------------------------------------------------------------
Q.6 churn rate by age definition?

with churn_table as 
(select customer_id,Age,
case 
when age < 18 then "Teenage"
when age <= 30 then "Young adult"
when age <=60 then "mid age"
when age >60 then "old age"
Else "late old"
End as Age_definition,customer_status
from telecom_churn)
select Age_definition,count(*) as customer,(count(*)/(select count(*) from churn_table)) *100 as churn_precent
from churn_table
where customer_status ='churned'
group by Age_definition;
-------------------------------------------------------------------------------------------------------------------------------------------
Q.7 churn rate by marriage ?

select "MARRIED" as marraige_status,count(*) as customer,(count(*)/(select count(*) from telecom_churn)) *100 as churn_percent
from telecom_churn
where married ="yes" AND customer_status ="churned"
union all
select "UNMARRIED" as marraige_status,count(*) as customer,(count(*)/(select count(*) from telecom_churn)) *100 as churn_percent
from telecom_churn
where married ="NO" AND customer_status ="churned"
order by churn_percent desc;
----------------------------------------------------------------------------------------------------------------------------------------------
Q.8 churn rate according to dependency?

select 'Married'as Marriage_status,sum(number_of_dependents) as dependents,(count(*)/(select count(*) from telecom_churn))*100 as churn_percent
from telecom_churn
where customer_status ="churned" and married ="yes"
union all
select 'Unmarried'as Marriage_status,sum(number_of_dependents) as dependents,(count(*)/(select count(*) from telecom_churn))*100 as churn_percent
from telecom_churn
where customer_status ="churned" and married ="no";