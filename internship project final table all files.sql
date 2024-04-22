use join_class_m_btch;
show tables;

-- select * from order_details_v1;
select
product,
x.category,
-- product_id,
-- for new customer retention rate
(((Jan_Customers - Jan_New_Customers) / Dec_Customers) ) AS Jan_NCRR,
(((feb_Customers - feb_New_Customers) / jan_Customers)) AS feb_NCRR,
(((mar_Customers - mar_New_Customers) / feb_Customers)) AS mar_NCRR,
(((apr_Customers - apr_New_Customers) / mar_Customers)) AS apr_NCRR,
(((may_Customers - may_New_Customers) / apr_Customers) ) AS may_NCRR,
(((june_Customers - june_New_Customers) / may_Customers) ) AS june_NCRR,
(((July_Customers - july_New_Customers) / june_Customers) ) AS July_NCRR,
(((aug_Customers - aug_New_Customers) / july_Customers) ) AS aug_NCRR,
(((sep_Customers - sep_New_Customers) / aug_Customers) ) AS sep_NCRR,
(((oct_Customers - oct_New_Customers) / sep_Customers) ) AS oct_NCRR,
(((nov_Customers - nov_New_Customers) / oct_Customers) ) AS nov_NCRR,
-- for unique retention rate
(((Jan_Customers - Jan_repeat_Customers) / Dec_Customers) ) AS Jan_UCRR,
(((feb_Customers - feb_repeat_Customers) / jan_Customers) ) AS feb_UCRR,
(((mar_Customers - mar_repeat_Customers) / feb_Customers) ) AS mar_UCRR,
(((apr_Customers - apr_repeat_Customers) / mar_Customers) ) AS apr_UCRR,
(((may_Customers - may_repeat_Customers) / apr_Customers) ) AS may_UCRR,
(((june_Customers - june_repeat_Customers) / may_Customers) ) AS june_UCRR,
(((July_Customers - july_repeat_Customers) / june_Customers) ) AS July_UCRR,
(((aug_Customers - aug_repeat_Customers) / july_Customers) ) AS aug_UCRR,
(((sep_Customers - sep_repeat_Customers) / aug_Customers) ) AS sep_UCRR,
(((oct_Customers - oct_repeat_Customers) / sep_Customers) ) AS oct_UCRR,
(((nov_Customers - nov_repeat_Customers) / oct_Customers)) AS nov_UCRR,
-- for unique retention rate percentage
(((Jan_Customers - Jan_repeat_Customers) / Dec_Customers) * 100) AS Jan_UCRR_PER,
(((feb_Customers - feb_repeat_Customers) / jan_Customers) * 100) AS feb_UCRR_PER,
(((mar_Customers - mar_repeat_Customers) / feb_Customers) * 100) AS mar_UCRR_PER,
(((apr_Customers - apr_repeat_Customers) / mar_Customers) * 100) AS apr_UCRR_PER,
(((may_Customers - may_repeat_Customers) / apr_Customers) * 100) AS may_UCRR_PER,
(((june_Customers - june_repeat_Customers) / may_Customers) * 100) AS juNe_UCRR_PER,
(((July_Customers - july_repeat_Customers) / june_Customers) * 100) AS July_UCRR_PER,
(((aug_Customers - aug_repeat_Customers) / july_Customers) * 100) AS aug_UCRR_PER,
(((sep_Customers - sep_repeat_Customers) / aug_Customers) * 100) AS sep_UCRR_PER,
(((oct_Customers - oct_repeat_Customers) / sep_Customers) * 100) AS oct_UCRR_PER,
(((nov_Customers - nov_repeat_Customers) / oct_Customers) * 100) AS nov_UCRR_PER,
Yday_orders,
Yday_GMV,
Yday_Revenue,
Yday_Customers,
Yday_New_customers,
Mtd_orders,
Mtd_GMV,
mtd_revenue,
round(sum(MTD_GMV - LMTD_GMV / LMTD_GMV),0) as MTD_GMV_Growth,
Mtd_Customers,
round(sum(mtd_revenue - lmtd_revenue/lmtd_revenue),0) as MTD_Revenue_Growth,
Mtd_New_Customers,
round(sum(MTD_New_customers-LMTD_New_Customers)/LMTD_New_Customers,0) as MTD_New_customer_Growth,
round(sum(mtd_customers-lmtd_customers)/lmtd_customers,0) as MTD_customer_Growth,
round(sum(MTD_orders-LMTD_orders)/LMTD_orders,0) as MTD_order_Growth,
round(sum(mtd_customers /lm_customers),0) as MTD_Revenue_Growth,
-- SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN new_repeat_customers/New_customers ELSE 0 END) AS M1,
-- SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN total_customers ELSE 0 END) AS Total_customer_jan,



lmtd_revenue,
lmtd_GMV,
LMTD_orders,
LMTD_customers,
LMTD_New_Customers,
lm_orders,
LM_GMV,
lm_revenue,
lm_customers,
lm_New_customers,
-- new_customers,
-- repeat_customers,
churned_customers,
dormant_customers,
SUM(CASE WHEN orders_range BETWEEN 1 AND 5 THEN mtd_customers ELSE 0 END) AS MTD_Customers_range_one_five,
SUM(CASE WHEN orders_range BETWEEN 1 AND 5 THEN (mtd_customers - lmtd_customers) / lmtd_customers  ELSE 0 END) AS MTD_Customers_Growth_range_one_five,
SUM(CASE WHEN orders_range BETWEEN 1 AND 5 THEN mtd_orders ELSE 0 END) AS MTD_Orders_range_one_five,

SUM(CASE WHEN orders_range BETWEEN 6 AND 10 THEN mtd_customers ELSE 0 END) AS MTD_Customers_range_five_ten,
SUM(CASE WHEN orders_range BETWEEN 6 AND 10 THEN (mtd_customers - lmtd_customers) / lmtd_customers  ELSE 0 END) AS MTD_Customers_Growth_range_five_ten,
SUM(CASE WHEN orders_range BETWEEN 6 AND 10 THEN mtd_orders ELSE 0 END) AS MTD_Orders_range_five_ten,

SUM(CASE WHEN orders_range BETWEEN 11 AND 15 THEN mtd_customers ELSE 0 END) AS MTD_Customers_range_ten_fifteen,
SUM(CASE WHEN orders_range BETWEEN 11 AND 15 THEN (mtd_customers - lmtd_customers) / lmtd_customers  ELSE 0 END) AS MTD_Customers_Growth_range_ten_fifteen,
SUM(CASE WHEN orders_range BETWEEN 11 AND 15 THEN mtd_orders ELSE 0 END) AS MTD_Orders_range_ten_fifteen,

SUM(CASE WHEN orders_range BETWEEN 16 AND 20 THEN mtd_customers ELSE 0 END) AS MTD_Customers_range_fifteen_twenty,
SUM(CASE WHEN orders_range BETWEEN 16 AND 20 THEN (mtd_customers - lmtd_customers) / lmtd_customers  ELSE 0 END) AS MTD_Customers_Growth_range_fifteen_twenty,
SUM(CASE WHEN orders_range BETWEEN 16 AND 20 THEN mtd_orders ELSE 0 END) AS MTD_Orders_range_fifteen_Twenty,

SUM(CASE WHEN orders_range > 20 THEN mtd_customers ELSE 0 END) AS MTD_Customers_range_morethantwenty,
SUM(CASE WHEN orders_range > 20 THEN (mtd_customers - lmtd_customers) / lmtd_customers  ELSE 0 END) AS MTD_Customers_Growth_range_morethantwenty,
SUM(CASE WHEN orders_range > 20 THEN mtd_orders ELSE 0 END) AS MTD_Orders_range_morethantwenty,

Total_GMV,
Total_GMV1,
Total_GMV2,
Total_GMV3,
Total_GMV4,
Total_GMV5,
Total_GMV6,
Total_GMV7,
CUSTOMERREPEAT,
CUSTOMERTOTAL,


SUM(CASE WHEN  gmv_range BETWEEN 1 AND 100 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv1,
SUM(CASE WHEN  gmv_range BETWEEN 101 AND 200 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv2,
SUM(CASE WHEN  gmv_range BETWEEN 201 AND 500 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv3,
SUM(CASE WHEN  gmv_range BETWEEN 501 AND 1000 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv4,
SUM(CASE WHEN  gmv_range BETWEEN 1001 AND 2000 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv5,
SUM(CASE WHEN  gmv_range BETWEEN 2001 AND 5000 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv6,
SUM(CASE WHEN  gmv_range BETWEEN 5001 AND 10000 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv7,
SUM(CASE WHEN  gmv_range >10000 THEN mtd_customers ELSE 0 END) AS MTD_Customers_gmv8,

SUM(CASE WHEN gmv_range BETWEEN 1 AND 100 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv1,
SUM(CASE WHEN gmv_range BETWEEN 101 AND 200 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv2,
SUM(CASE WHEN gmv_range BETWEEN 201 AND 500 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv3,
SUM(CASE WHEN gmv_range BETWEEN 501 AND 1000 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv4,
SUM(CASE WHEN gmv_range BETWEEN 1001 AND 2000 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv5,
SUM(CASE WHEN gmv_range BETWEEN 2001 AND 5000 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv6,
SUM(CASE WHEN gmv_range BETWEEN 5001 AND 10000 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv7,
SUM(CASE WHEN gmv_range > 10000 THEN (mtd_customers-lmtd_customers)/lmtd_customers ELSE 0 END) AS MTD_Customers_Growth_gmv8,

SUM(CASE WHEN gmv_range BETWEEN 1 AND 100 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv1,
SUM(CASE WHEN gmv_range BETWEEN 101 AND 200 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv2,
SUM(CASE WHEN gmv_range BETWEEN 201 AND 500 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv3,
SUM(CASE WHEN gmv_range BETWEEN 501 AND 1000 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv4,
SUM(CASE WHEN gmv_range BETWEEN 1001 AND 2000 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv5,
SUM(CASE WHEN gmv_range BETWEEN 2001 AND 5000 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv6,
SUM(CASE WHEN gmv_range BETWEEN 5001 AND 10000 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv7,
SUM(CASE WHEN gmv_range > 10000 THEN lmtd_customers ELSE 0 END) AS LMTD_Customers_gmv8,

SUM(CASE WHEN gmv_range BETWEEN 1 AND 100 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV1,
SUM(CASE WHEN gmv_range BETWEEN 101 AND 200 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV2,
SUM(CASE WHEN gmv_range BETWEEN 201 AND 500 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV3,
SUM(CASE WHEN gmv_range BETWEEN 501 AND 1000 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV4,
SUM(CASE WHEN gmv_range BETWEEN 1001 AND 2000 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV5,
SUM(CASE WHEN gmv_range BETWEEN 2001 AND 5000 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV6,
SUM(CASE WHEN gmv_range BETWEEN 5001 AND 10000 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV7,
SUM(CASE WHEN gmv_range > 10000 THEN lmtd_gmv ELSE 0 END) AS LMTD_GMV8



from
(select
x.product,
category,

-- SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN customers/lm_new_customers ELSE 0 END) AS M1,
-- UM(CASE WHEN x.order_date BETWEEN '2023-02-01' AND '2023-02-29' THEN customers/lm_new_customers ELSE 0 END) AS M2,
SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN New_customers ELSE 0 END) AS  Jan_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN total_customers ELSE 0 END) AS Jan_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN repeat_customers ELSE 0 END) AS Jan_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-02-01' AND '2023-02-28' THEN New_customers ELSE 0 END) AS feb_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-02-01' AND '2023-02-28' THEN total_customers ELSE 0 END) AS feb_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-02-01' AND '2023-02-28' THEN repeat_customers ELSE 0 END) AS feb_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-03-01' AND '2023-03-31' THEN New_customers ELSE 0 END) AS  mar_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-03-01' AND '2023-03-31' THEN total_customers ELSE 0 END) AS mar_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-03-01' AND '2023-03-31' THEN repeat_customers ELSE 0 END) AS mar_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-04-01' AND '2023-04-30' THEN New_customers ELSE 0 END) AS  apr_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-04-01' AND '2023-04-30' THEN total_customers ELSE 0 END) AS apr_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-04-01' AND '2023-04-30' THEN repeat_customers ELSE 0 END) AS apr_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-05-01' AND '2023-05-31' THEN New_customers ELSE 0 END) AS  may_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-05-01' AND '2023-05-31' THEN total_customers ELSE 0 END) AS may_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-05-01' AND '2023-05-31' THEN repeat_customers ELSE 0 END) AS may_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-06-01' AND '2023-06-30' THEN New_customers ELSE 0 END) AS  June_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-06-01' AND '2023-06-30' THEN total_customers ELSE 0 END) AS June_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-06-01' AND '2023-06-30' THEN repeat_customers ELSE 0 END) AS June_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2022-12-01' AND '2022-12-31' THEN total_customers ELSE 0 END) AS dec_Customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-08-01' AND '2023-08-31' THEN New_customers ELSE 0 END) AS  aug_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-08-01' AND '2023-08-31' THEN total_customers ELSE 0 END) AS aug_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-08-01' AND '2023-08-31' THEN repeat_customers ELSE 0 END) AS aug_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-09-01' AND '2023-09-30' THEN New_customers ELSE 0 END) AS  sep_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-09-01' AND '2023-09-30' THEN total_customers ELSE 0 END) AS sep_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-09-01' AND '2023-09-30' THEN repeat_customers ELSE 0 END) AS sep_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-10-01' AND '2023-10-31' THEN New_customers ELSE 0 END) AS  oct_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-10-01' AND '2023-10-31' THEN total_customers ELSE 0 END) AS oct_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-10-01' AND '2023-10-31' THEN repeat_customers ELSE 0 END) AS oct_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023-11-01' AND '2023-11-30' THEN New_customers ELSE 0 END) AS  nov_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-11-01' AND '2023-11-30' THEN total_customers ELSE 0 END) AS nov_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-11-01' AND '2023-11-30' THEN repeat_customers ELSE 0 END) AS nov_repeat_customers,

SUM(CASE WHEN x.order_date BETWEEN '2023--01' AND '2023-07-31' THEN New_customers ELSE 0 END) AS  July_New_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-07-01' AND '2023-07-31' THEN total_customers ELSE 0 END) AS July_Customers,
SUM(CASE WHEN x.order_date BETWEEN '2023-07-01' AND '2023-07-31' THEN repeat_customers ELSE 0 END) AS July_repeat_customers,





-- SUM(CASE WHEN x.order_date BETWEEN '2023-01-01' AND '2023-01-31' THEN total_customers ELSE 0 END) AS Total_customer_jan,

SUM(CASE WHEN x.order_date BETWEEN date_format(curdate(),"%y-%m-01") AND (curdate() - interval 1 day) THEN customers ELSE 0 END) AS unique_repeat_customers,
SUM(CASE WHEN x.order_date BETWEEN date_format(curdate(),"%y-%m-01") AND (curdate() - interval 1 day) THEN New_customers ELSE 0 END) AS new_repeat_customers,

count(gmv) as gmv_range,
count(orders) as orders_range,
COUNT(REPEAT_CUSTOMERS) AS CUSTOMERREPEAT,
COUNT(TOTAL_CUSTOMERS) AS CUSTOMERTOTAL,

-- SUM(CASE WHEN x.order_date BETWEEN date_format(curdate(),"%y-%m-01") AND (curdate() - interval 1 day) THEN customers ELSE 0 END) AS new_customers,
-- SUM(CASE WHEN x.order_date BETWEEN date_format(curdate(),"%y-%m-01") AND (curdate() - interval 1 day) THEN customers ELSE 0 END) AS repeat_customers,
SUM(CASE WHEN x.order_date BETWEEN date_format(curdate(),"%y-%m-01") AND (curdate() - interval 1 day) THEN 0 ELSE customers END) AS churned_customers,
SUM(CASE WHEN x.order_date < date_format(curdate(),"%y-%m-01") THEN customers ELSE 0 END) AS dormant_customers,



SUM(CASE WHEN gmv BETWEEN 1 AND 100 THEN gmv ELSE 0 END) AS Total_GMV,
SUM(CASE WHEN gmv BETWEEN 101 AND 100 THEN gmv ELSE 200 END) AS Total_GMV1,
SUM(CASE WHEN gmv BETWEEN 201 AND 100 THEN gmv ELSE 500 END) AS Total_GMV2,
SUM(CASE WHEN gmv BETWEEN 501 AND 100 THEN gmv ELSE 1000 END) AS Total_GMV3,
SUM(CASE WHEN gmv BETWEEN 1001 AND 2000 THEN gmv ELSE 0 END) AS Total_GMV4,
SUM(CASE WHEN gmv BETWEEN 2001 AND 5000 THEN gmv ELSE 0 END) AS Total_GMV5,
SUM(CASE WHEN gmv BETWEEN 5001 AND 10000 THEN gmv ELSE 0 END) AS Total_GMV6,
SUM(CASE WHEN gmv > 10000 THEN gmv ELSE 0 END) AS Total_GMV7,

-- SUM(CASE WHEN order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) THEN new_customers ELSE 0 END) AS new_customers,
-- SUM(CASE WHEN x.order_date BETWEEN '2023-11-01' AND '2023-11-30' THEN customers ELSE 0 END) AS repeat_customers,
-- SUM(CASE WHEN x.order_date < '2023-11-01' AND x.order_date >= '2023-11-01' THEN customers ELSE 0 END) AS churned_customers,
-- SUM(CASE WHEN x.order_date < '2023-11-01' AND x.order_date >= '2023-11-01' THEN customers ELSE 0 END) AS dormant_customers,
coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then orders end),0) as Yday_orders,
coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then GMV end),0) as Yday_GMV,
round(coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then GMV end),0),1) as Yday_Revenue,
coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then customers end),0) as Yday_customers,
coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then New_customers end),0) as Yday_New_customers,
coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then live_products end),0)as  Yday_live_products,
coalesce(sum(case when x.order_date = date_add(curdate(), interval 1 day)then live_stores end),0) as Yday_live_stores, 
 coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then orders end),0) as MTD_orders,
coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then gmv end),0) as MTD_GMV,
round(coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then Revenue end),0),0) as MTD_Revenue,
coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then customers end),0) as MTD_customers,
coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then New_customers end),0) as MTD_New_customers,
coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then live_products end),0) as MTD_live_products,
coalesce(sum(case when order_date between date(last_day(curdate()- interval 1 month) + interval 1 day) and date_add(current_date(), interval -1 day ) then live_stores end),0) as MTD_live_stores,
coalesce(sum(case when order_date between date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and date_add(current_date(), interval- 1 month) then orders end),0) as LMTD_orders,
coalesce(sum(case when order_date between date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and date_add(current_date(), interval- 1 month) then GMV end),0) as LMTD_GMV,
coalesce(sum(case when order_date between date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and date_add(current_date(), interval- 1 month) then Revenue end),0) as LMTD_Revenue,
coalesce(sum(case when order_date between date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and date_add(current_date(), interval- 1 month) then customers end),0) as LMTD_customers,
coalesce(sum(case when order_date between date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and date_add(current_date(), interval- 1 month) then New_customers end),0) as LMTD_New_Customers,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then orders end),0) as LM_orders,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then GMV end),0) as LM_GMV,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then Revenue end),0) as LM_Revenue,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then customers end),0) as LM_customers,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then New_customers end),0) as LM_New_customers,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then live_products end),0) as LM_live_products,
coalesce(sum(case when x.order_date >= date(LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY) and  order_date<= date(last_day(curdate() - interval 1 month) - interval  0 day ) then live_stores end),0) as LM_live_stores


from

(select 
product,
x.product_id,
category,
x.order_date,
count(distinct x.order_id) as orders,
sum(distinct x.selling_price) as gmv,
sum(distinct x.selling_price)/1.18 as Revenue,
count(distinct x.customer_id) as customers,
count(distinct x.product_id)as live_products,
count(distinct x.store_id) as live_stores,
count( x.customer_id) as total_customers,

COUNT(*) - COUNT(DISTINCT x.customer_id) AS repeat_customers,

count(distinct z.rnk)as New_customers
from order_details_v1 x
left join
producthierarchy as y on x.product_id=y.product_id
left join
(select 
* from
(select 
customer_id,
order_date,
order_id,
rank() over (partition by customer_id order by order_date) as rnk
 from order_details_v1 x)x where rnk=1)z on x.customer_id=z.customer_id
 group by 1,2,3,4)x
 group by 1,2) x group by 1,2;
 
