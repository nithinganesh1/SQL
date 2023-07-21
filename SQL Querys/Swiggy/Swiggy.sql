select * from swiggy

UPDATE swiggy
SET price = 
    CASE 
        WHEN price LIKE '%?% FOR TWO' THEN 
            CAST(ROUND(CAST(SUBSTRING(price, CHARINDEX('?', price) + 1, LEN(price) - CHARINDEX('?', price) - 10) AS FLOAT) / 2.0, 0) AS INT)
        ELSE 
            CAST(REPLACE(price, '?', '') AS INT)
    END

ALTER TABLE swiggy
ALTER COLUMN price INT

--#1 HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(distinct restaurant_no) as [hight rated] from swiggy
where rating >4.5

--#2 WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select Top 1 city,COUNT(distinct restaurant_no) restouant_count from swiggy
group by city
order by restouant_count desc 

--#3 HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select count(distinct restaurant_no)as count_restaurant from swiggy
where restaurant_name like '%Pizza%'

--#4 WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select Top 1 cuisine,count(*) as cuisine_count from swiggy
group by cuisine
order by cuisine_count desc

--#5 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select city, avg(rating) avg_rating from swiggy
group by city
order by avg_rating desc
------------------------

select * from swiggy

--#6 WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_no,menu_category,max(price) max_price from swiggy
where menu_category= 'Recommended'
group by restaurant_no,menu_category

--#7 FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE

SELECT Distinct TOP 5 restaurant_no,restaurant_name, cuisine, cost_per_person
FROM swiggy
WHERE cuisine <> 'INDIAN'
ORDER BY cost_per_person DESC


--#8 FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_no,restaurant_name,cost_per_person from swiggy
where cost_per_person > (select avg(cost_per_person) from swiggy)
order by cost_per_person desc


--#9 RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES 
select distinct t1.restaurant_no,t2.restaurant_no, t1.restaurant_name,t1.city,t2.city from swiggy t1
join swiggy t2 
on t1.restaurant_name = t2.restaurant_name and t1.city !=t2.city

--#10 WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select Top 1 restaurant_no,menu_category, count(item) iteam_count from swiggy
where menu_category = 'MAIN COURSE'
group by restaurant_no,menu_category
order by iteam_count desc
--------------------------
select * from swiggy

--#11 LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME
select distinct restaurant_name,(
	count(case when veg_or_nonveg = 'Veg' then 1 end)*100/
	count(*)) as veg_persantage 
from swiggy
group by restaurant_name
having count(case when veg_or_nonveg = 'Veg' then 1 end)*100/count(*) =100.0
order by restaurant_name


--#12 WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select top 1 restaurant_no, restaurant_name,avg(price) avg_price from swiggy
group by restaurant_no,restaurant_name
order by avg_price desc

--#13 WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select top 5 restaurant_no,count(menu_category) as no_of_category from swiggy
group by restaurant_no
order by no_of_category desc

--#14 WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select top 5 restaurant_no,restaurant_name, (
	count(case when veg_or_nonveg = 'Non-veg' then 1 end)*100/
	count(*)) as nonveg_persantage 
from swiggy
group by restaurant_no,restaurant_name
order by nonveg_persantage desc