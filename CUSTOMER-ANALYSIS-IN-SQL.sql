B.	CUSTOMER OVERVIEW: -----------------------------------------------

Q.1 Total No of customer?
select count(distinct customer_id) as No_customer
from telecom_churn;
----------------------------------------------------------------------------------------------------------
Q.2 No of customer by gender?
select 'Male' as Gender ,(select count(*) from telecom_churn where gender = 'male') as No_customer
union all
select 'Female' as Gender ,(select count(*) from telecom_churn where gender = 'female') as No_customer;

--------------------------------------------------------------------------------------------------------------------------------
Q.3 How many customer are married and not married?

select distinct (select  count(*) from telecom_churn where married = 'yes') as Married,
(select  count(*) from telecom_churn where married ='no')as Unmarried
from telecom_churn;

---------------------------------------------------------------------------------------------------------------------------------------
Q.4 No of dependent on married and unmarried customer?

select 'Married'as Marriage_status,(select sum(number_of_dependents) as dependent from telecom_churn where married='yes') as No_dependent
union all
select 'Unmarried'as Marriage_status,(select sum(number_of_dependents) as dependent from telecom_churn where married='no') as No_dependent;

-------------------------------------------------------------------------------------------------------------------------------------------
Q.5 Top 5 city by customer?

select city, count(customer_id) as No_customer
from telecom_churn
group by city
order by No_customer desc
limit 5;

---------------------------------------------------------------------------------------------------------------------------------------------
Q.6 find out the customer who have greater tenure than overall average tenure?

select customer_id, Tenure_in_Months
from telecom_churn
where tenure_in_months >(select avg(tenure_in_months) 
from telecom_churn)
order by Tenure_in_Months desc
limit 15 ;

------------------------------------------------------------------------------------------------------------------------------------------------
Q.7 Age of customer defined as young,middle age,old age?

select customer_id,Age,
case 
when age < 18 then "Teenage"
when age <= 30 then "Young adult"
when age <=60 then "mid age"
when age >60 then "old age"
Else "late old"
End as Age_defination
from telecom_churn
order by age ASC;


