--SERVICE OVERVIEW---------------------------------

Q.1) what are the services provided by the company?

create view service_tab as
select customer_id, Services,status_ from
(select customer_id,'Phone_Service' as Services, Phone_Service as status_ from telecom_churn
union all
select customer_id, 'Multiple_Lines' as Services, Multiple_Lines as status_ from telecom_churn
union all
select customer_id, 'Internet_Service' as Services, Internet_Service as status_ from telecom_churn
union all
select customer_id,'Online_Security' as Services, Online_Security as status_ from telecom_churn
union all
select customer_id,'Online_Backup' as Services, Online_Backup as status_ from telecom_churn
union all
select customer_id, 'Device_Protection_Plan' as Services, Device_Protection_Plan as status_ from telecom_churn
union all
select customer_id,'Premium_Tech_Support' as Services, Premium_Tech_Support as status_ from telecom_churn
union all
select customer_id, 'Streaming_TV' as Services, Streaming_TV as status_ from telecom_churn
union all
select customer_id, 'Streaming_Movies' as Services, Streaming_Movies as status_ from telecom_churn
union all
select customer_id,'Streaming_Music' as Services, Streaming_Music as status_ from telecom_churn
union all
select customer_id ,'Unlimited_Data' as Services, Unlimited_Data as status_ from telecom_churn) as service_table;

---------------------------------------------------------------------------------------------------------------------------------------
Q.1) ANSWER :- 
select distinct services
from service_tab;
---------------------------------------------------------------------------------------------------------------------------------------------
Q2. Distribution of customer using each services?

select services,count(status_) as No_customer
from service_tab
where status_ = 'yes'
group by services;

------------------------------------------------------------------------------------------------------------------------------------------------
Q.3 highest Selling Services 

select services,count(status_) as No_customer
from service_tab
where status_ = 'yes'
group by services
order by NO_customer desc
limit 1;

------------------------------------------------------------------------------------------------------------------------------------------------
Q.4 lowest selling services ?

select services,count(status_) as No_customer
from service_tab
where status_ = 'yes'
group by services
order by NO_customer asc
limit 1;
-----------------------------------------------------------------------------------------------------------------------------------------------
Q.5 how may people accepted and rejected  the offer ?
--ACCEPTENCE--
select offer,count(customer_id)as no_customer_accepted
from telecom_churn
where offer <> 'none'
group by offer;

--REJECTED---
select count(customer_id) as No_customer_rejected
from telecom_churn
where offer ='none';

--------------------------------------------------------------------------------------------------------------------------------------------
Q.6 How many times customer reffered someone by referral?

select sum( Number_of_referrals) as No_of_time_reffered
from telecom_churn;

--------------------------------------------------------------------------------------------------------------------------------------------








