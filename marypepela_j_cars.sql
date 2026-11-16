create schema if not exists j_cars;
set search_path to j_cars;
create table if not exists sale_cars (
order_id        TEXT,
order_date      TEXT,
delivery_date   TEXT,
customer_name   TEXT,
customer_type   TEXT,
customer_age    TEXT,
region          TEXT,
county          TEXT,
city            TEXT,
branch          TEXT,
sales_rep       TEXT,
lead_source     TEXT,
car_make        TEXT,
car_model       TEXT,
vehicle_type    TEXT,
vehicle_year    TEXT,
fuel_type       TEXT,
transmission     TEXT,
color            TEXT,
unit_sold       TEXT,
unit_sellingprice  TEXT,
unit_cost       TEXT,
discount        TEXT,
delivery_fee    TEXT,
logistics_cost  TEXT,
payment_method   TEXT, 
payment_status     TEXT,
delivery_status    TEXT,
customer_rating    TEXT,
review_count       TEXT,
returned            TEXT,
revenue_recorded    TEXT
);
select count(*) from sale_cars;
SELECT * from sale_cars; LIMIT 30;

SELECT distinct customer_type from sale_cars;

select vehicle_type,
string_agg(distinct car_model,','order by car_model) as model
from sale_cars
group by vehicle_type;

update sale_cars
set vehicle_type='Sedan'
where vehicle_type='';

update sale_cars
set vehicle_type='Hatchback'
where vehicle_type='-';

update sale_cars
set vehicle_type='Sedan'
where vehicle_type='Saloon';

update sale_cars
set fuel_type=initcap(trim(fuel_type))
where fuel_type!=initcap(trim(fuel_type));

select distinct fuel_type from sale_cars;
select distinct color from sale_cars;

update sale_cars
set fuel_type=case
	when fuel_type='Ev' then 'Electric'
	when fuel_type='Gasoline' then 'Petrol'
	when fuel_type='Pms' then 'Petrol'
	when fuel_type='Dsl'then 'Diesel'
	when fuel_type='Hyb'then 'Hybrid'
	when fuel_type='Hybrid/Petrol' then 'Hybrid'
	else fuel_type
end;

update sale_cars
set color=initcap(trim(color))
where color!=initcap(trim(color));

update sale_cars
set color=case
	when color='Bla' then 'Black'
	when color='Whi' then 'White'
	when color='Blu' then 'Blue'
	when color='Sil'then 'Silver'
	when color='Gre'then 'Grey'
	else color
end;

select distinct returned from sale_cars;

update sale_cars
set returned=initcap(trim(returned))
where returned!=initcap(trim(returned));

update sale_cars
set returned=case
	when returned in ('True','Yes','Y') then 'Returned'
	when returned in ('N','No','False') then 'Not Returned'
	else returned
end;

update sale_cars
set returned=case
	when returned ='' then 'Unknown'
	when returned = '-'then 'Unknown'
	else returned
end;

SELECT distinct transmission from sale_cars;
update sale_cars
set transmission=initcap(trim(transmission))
where transmission!=initcap(trim(transmission));

update sale_cars
set transmission=case
	when transmission in ('Auto','At','A/T') then 'Automatic'
	when transmission in ('M/T','Mt') then 'Manual'
	else transmission
end;
SELECT * from sale_cars;
update sale_cars
set transmission=case
	when transmission ='N/A' then 'Unknown'
	when transmission = '-'then 'Unknown'
	else transmission
end;
update sale_cars
set branch=case
	when branch ='N/A' then 'Unknown'
	when branch = '-'then 'Unknown'
	else branch
end;
select distinct branch from sale_cars;
update sale_cars 
set branch=initcap(trim(branch))
where branch!=initcap(trim(branch));

update sale_cars 
set branch=replace(branch,'Hq','');
where branch='Yard';

update sale_cars 
set branch=replace(branch,'Branch','');
update sale_cars 
set branch=replace(branch,'Port','');

update sale_cars
set branch=case
	when branch= 'Msa'then 'Mombasa'
	when branch='Ksm' then 'Kisumu'
	when branch='Nkr' then 'Nakuru'
	when branch='Eld' then 'Eldoret'
	when branch='Athiriver' then 'Athi River'
	when branch in ('Naironi Hq','Main') then 'Nairobi'
	else branch	
end;
select distinct region from sale_cars;
update sale_cars 
set region=initcap(trim(region))
where region!=initcap(trim(region));

select region,
string_agg(distinct county,','order by county) as yard
from sale_cars
group by region;
update sale_cars 
set region=replace(region,'Msa','Coast');

update sale_cars
set region=case
	when region in ('','Cental')then 'Central'
	when region='Cost' then 'Coast'
	when region in ('East','Eastrn') then 'Eastern'
	when region in ('West','Westen') then 'Western'
	when region in ('Riftvalley','Rift','Rift-Valley') then 'Rift Valley'
	when region in ('Nrb','Nairobii') then 'Nairobi'
	else region	
end;

update sale_cars
set region=case
	when region = 'Mt Kenya' then 'Central'
	when region='Msa' then 'Coast'
	when region = 'Ksm' then 'Nyanza'
	when region = 'Nbi' then 'Nairobi'
	else region	
end;

select distinct county from sale_cars;
update sale_cars 
set county=initcap(trim(county))
where county!=initcap(trim(county));

update sale_cars 
set county=replace(county,' County','');

update sale_cars
set county=case
	when county= 'Msa'then 'Mombasa'
	when county='Ksm' then 'Kisumu'
	when county='Nkr' then 'Nakuru'
	when county='Kambu' then 'Kiambu'
	when county in ('Uasingishu','Uasin-Gishu') then 'Uasin Gishu'
	when county in ('Nairobii','Nrb') then 'Nairobi'
	when county in ('Mks','Mchakos') then 'Machakos'
	else county	
end;

select county,
string_agg(distinct city,','order by city) as regon
from sale_cars
group by county;

update sale_cars
set county=replace(county,'Null','Uasin Gishu');

update sale_cars 
set city=initcap(trim(city))
where city!=initcap(trim(city));
select distinct city from sale_cars;

update sale_cars
set city=replace(city,' Town','');

update sale_cars
set city=case
	when city= 'Msa'then 'Mombasa'
	when city='Ksm' then 'Kisumu'
	when city='Nkr' then 'Nakuru'
	when city='Eld' then 'Eldoret'
	when city='Thikka' then 'Thika'
	when city='Athiriver' then 'Athi River'
	else city	
end;

update sale_cars 
set order_id=initcap(trim(order_id))
where order_id!=initcap(trim(order_id));
update sale_cars
set order_id=replace(order_id,'-','');
select distinct order_id from sale_cars;

select * FROM sale_cars
WHERE ctid NOT IN 
    (SELECT MIN(ctid) FROM sale_cars GROUP BY order_id);

select order_id, count(*)
from sale_cars
group by order_id 
having count(*)>1;

select * 
from sale_cars 
where order_id='Car1086';

select * from sale_cars;--
select distinct customer_rating from sale_cars;
update sale_cars 
set vehicle_year ='2020'
where vehicle_year='Twenty Twenty';
update sale_cars 
set vehicle_year ='Unknown'
where vehicle_year in ('','N/A','null');
update sale_cars 
set vehicle_year=replace(vehicle_year,'202A','2024');

update sale_cars 
set customer_rating=replace(customer_rating,'Excellent','5.0');
update sale_cars 
set customer_rating ='Unknown'
where customer_rating in ('','N/A');
select distinct unit_sellingprice from sale_cars;
update sale_cars 
set unit_sellingprice=initcap(trim(unit_sellingprice))
where unit_sellingprice!=initcap(trim(unit_sellingprice));

update sale_cars 
set unit_sellingprice=case
	when unit_sellingprice='Missing' then 'Unknown'
	when unit_sellingprice='-' then ''
	when unit_sellingprice=',' then ''
	when unit_sellingprice='Ksh ' then ''
	when unit_sellingprice='Kes ' then ''
	else unit_sellingprice
end;
update sale_cars 
set revenue_recorded='Unknown'
where revenue_recorded in ('Error','#Value!','Missing','','Tbd','Not Available');
update sale_cars 
set revenue_recorded=(replace(revenue_recorded,'m','')::numeric*1000000)::text
where revenue_recorded like '%m';
update sale_cars 
set review_count=initcap(trim(review_count))
where review_count!=initcap(trim(review_count));
update sale_cars 
set revenue_recorded=initcap(trim(revenue_recorded))
where revenue_recorded!=initcap(trim(revenue_recorded));

select distinct revenue_recorded from sale_cars;
select distinct review_count from sale_cars;
update sale_cars 
set revenue_recorded=(replace(revenue_recorded,',',''));

SELECT * from sale_cars;
update sale_cars 
set review_count=(replace(review_count,'ten','10'));
update sale_cars 
set discount='Unknown'
where discount in ('','#Error','Disc','Null');

update sale_cars 
set discount='0'
where discount in ('None','No Discount');

select distinct discount from sale_cars;
update sale_cars 
set discount=(replace(discount,'-',''));
update sale_cars 
set discount=initcap(trim(discount))
where discount!=initcap(trim(discount));
update sale_cars 
set discount=(replace(discount,'%','')::numeric*0.01)::text
where discount like '%\%%';

update sale_cars 
set discount=(discount::numeric*0.01)::text
where discount ~ '^[0-9]+$';

select distinct order_date from sale_cars;
select order_date,
  case 
	when order_date ~ '^[0-9]+$' then (DATE'1899-12-30'+ order_date::integer)::text
	when order_date  ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(order_date,'/',2)::integer>12 then to_date(order_date,'MM,DD,YYYY')::text
	when order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(order_date,'/',2)::integer>12 then to_date(order_date,'DD/MM/YYYY')::text
	when order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' then to_date(order_date,'DD/MM/YYYY')::text
	when order_date ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$' then to_date(order_date,'DD-Mon-YY')::text
	else order_date
  end as cleaned
from sale_cars;

Update sale_cars 
set order_date='2025-09-17'
where order_date='2025-17-09';
2025-08-07,2026-06-05,2026-11-04,2025-11-01,2026-09-03,2025-02-06,2025-11-09,2025-05-01,2025-02-01,2025-01-08
2026-10-03,2026-10-04,2025-09-04,2025-10-07,2026-04-01,2025-07-11,2025-07-04,

update sale_cars
set order_date=case 
	when order_date ~ '^[0-9]+$' then (DATE'1899-12-30'+ order_date::integer)::text
	when order_date  ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(order_date,'/',2)::integer>12 then to_date(order_date,'MM,DD,YYYY')::text
	when order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(order_date,'/',2)::integer>12 then to_date(order_date,'DD/MM/YYYY')::text
	when order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' then to_date(order_date,'DD/MM/YYYY')::text
	when order_date ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$' then to_date(order_date,'DD-Mon-YY')::text
	else order_date
end;

select distinct delivery_date from sale_cars;

select delivery_date,
  case 
	when delivery_date ~ '^[0-9]+$' then (DATE'1899-12-30'+ delivery_date::integer)::text
	when delivery_date  ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(delivery_date,'/',2)::integer>12 then to_date(delivery_date,'MM,DD,YYYY')::text
	when delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(delivery_date,'/',2)::integer>12 then to_date(delivery_date,'DD/MM/YYYY')::text
	when delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' then to_date(delivery_date,'DD/MM/YYYY')::text
	when delivery_date ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$' then to_date(delivery_date,'DD-Mon-YY')::text
	else delivery_date
  end as cleaned
from sale_cars;

update sale_cars
set delivery_date=replace(delivery_date,'April 31 2026','30-Apr-26');

update sale_cars
set delivery_date=case 
	when delivery_date ~ '^[0-9]+$' then (DATE'1899-12-30'+ delivery_date::integer)::text
	when delivery_date  ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(delivery_date,'/',2)::integer>12 then to_date(delivery_date,'MM,DD,YYYY')::text
	when delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' and split_part(delivery_date,'/',2)::integer>12 then to_date(delivery_date,'DD/MM/YYYY')::text
	when delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' then to_date(delivery_date,'DD/MM/YYYY')::text
	when delivery_date ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$' then to_date(delivery_date,'DD-Mon-YY')::text
	else delivery_date
end;

Update sale_cars 
set delivery_date='Unknown'
where delivery_date in ('not sure','-','','N/A','NULL');

Update sale_cars 
set delivery_date='2025-09-03'
where delivery_date = '2025-09-17' and order_date='2025-09-17';

select distinct order_date from sale_cars;
where customer_name like '%  %';
Update sale_cars 
set customer_name='Unknown'
where customer_name in ('','N/A','Null');

select order_id,count(*) as count1
from sale_cars 
group by order_id
having count(*)>1;
select distinct order_id from sale_cars;
where order_id='';

Update sale_cars 
set order_id='Unknown'
where order_id in ('','N/A');

CREATE TABLE IF NOT EXISTS g_gari (
order_id        VARCHAR(10) ,
order_date      DATE,
delivery_date   DATE,
customer_name   VARCHAR(100),
customer_type   VARCHAR(50),
customer_age    INTEGER,
region          VARCHAR(20),
county          VARCHAR(20),
city            VARCHAR(20),
branch          VARCHAR(20),
sales_rep       VARCHAR(100),
lead_source     VARCHAR(20),
car_make        VARCHAR(20),
car_model       VARCHAR(30),
vehicle_type    VARCHAR(20),
vehicle_year    INTEGER,
fuel_type       VARCHAR(10),
transmission     VARCHAR(20),
color            VARCHAR(10),
units_sold       INTEGER,
unit_sellingprice  NUMERIC(15,2),
unit_cost       NUMERIC(15,2),
discount        NUMERIC(3,1),
delivery_fee    NUMERIC(15,2),
logistics_cost  NUMERIC(15,2),
payment_method   VARCHAR(20), 
payment_status     VARCHAR(20),
delivery_status    VARCHAR(20),
customer_rating    NUMERIC(2,1),
review_count       INTEGER,
returned            VARCHAR(20),
revenue_recorded    NUMERIC(15,2)
);

drop table magari;TO_DATE(NULLIF(TRIM(delivery_date),'Unknown'),'YYYY-DD-MM') ,

INSERT INTO g_gari
select
    order_id, TRIM(order_date)::date,
    TRIM(delivery_date)::date ,
    INITCAP(TRIM(customer_name)),
    COALESCE(NULLIF(TRIM(customer_type),''),'Unknown'),
    TRIM(customer_age)::INTEGER,region,county,city,branch,
    TRIM(sales_rep),lead_source,car_make,car_model,vehicle_type,
    NULLIF(TRIM(vehicle_year),'Unknown')::INTEGER,fuel_type,transmission,color,
   (units_sold)::INTEGER, (unit_sellingprice)::NUMERIC,
    (unit_cost)::NUMERIC,(discount)::NUMERIC,
    (delivery_fee)::NUMERIC,(logistics_cost)::NUMERIC,
    payment_method,payment_status,delivery_status,(customer_rating)::NUMERIC,
    (review_count)::INTEGER,returned,(revenue_recorded)::NUMERIC
FROM sale_cars;

drop table ggari;

alter table gari 
drop constraint gari_pkey;
select order_id,order_date,delivery_date
from sale_cars where delivery_date='2025-10-27'or order_date='2025-10-27';

select order_date,delivery_date
from sale_cars where delivery_date is NULL or order_date is NULL;

select order_id,order_date,delivery_date,
 --make_date(
  --extract(year from order_date)::int,
  --extract(day from order_date)::int,
  --extract(month from order_date)::int
 --) as swap_order,
 make_date(
  extract(year from delivery_date)::int,
  extract(day from delivery_date)::int,
  extract(month from delivery_date)::int
 ) as swap_delivery
 from sale_cars where delivery_date<order_date; 
--make_date(
  --extract(year from order_date)::int,
  --extract(day from order_date)::int,
  --extract(month from order_date)::int
 --) as swap_order,
 
update sale_cars
set order_date=NULLIF(TRIM(order_date),'Unknown'),
    delivery_date=NULLIF(TRIM(delivery_date),'Unknown');

select order_id,order_date,delivery_date
from sale_cars where delivery_date is not NULL 
AND order_date is not null and delivery_date<order_date;

select order_id,order_date,delivery_date
from sale_cars where delivery_date is not NULL 
AND delivery_date!~'^\d{4}-\d{2}-\d{2}$' or order_date is not null and order_date!~'^\d{4}-\d{2}-\d{2}$';

select order_id,order_date,delivery_date
from sale_cars where (delivery_date is not null AND split_part(delivery_date,'-',2)='02' 
AND split_part(delivery_date,'-',3)::int>29) or (order_date is not null 
and split_part(order_date,'-',2)='02'
and split_part(order_date,'-',3)::int>29);

select order_id,order_date,delivery_date
from sale_cars where delivery_date is not null AND order_date is not null 
and (order_date<>'' and delivery_date<>''
);

select order_id,order_date,delivery_date,
split_part(order_date,'-',1)
||'-'||
split_part(order_date,'-',3)
||'-'||
split_part(order_date,'-',2) as swap_odate,
split_part(delivery_date,'-',1)
||'-'||
split_part(delivery_date,'-',3)
||'-'||
split_part(delivery_date,'-',2) as swap_ddate
from sale_cars where order_id in ('Lc1149','Car1183');--16?,27?,33,37,38,39,40
--2025-05-12,2025-04-07,2026-01-06,12,14,2025-02-06,,19,2025-04-05,2026-01-05,2025-05-09,2025-03-06
--2025-02-04,2026-03-04,2025-04-08,2025-08-11
update sale_cars
set 
 order_date=
   split_part(order_date,'-',1)
   ||'-'||
   split_part(order_date,'-',3)
   ||'-'||
   split_part(order_date,'-',2),
 delivery_date=
   split_part(delivery_date,'-',1)
   ||'-'||
   split_part(delivery_date,'-',3)
   ||'-'||
   split_part(delivery_date,'-',2)
where order_date in('2026-10-03','2026-12-04')
and delivery_date in ('2026-03-08','2026-09-05');

update sale_cars
set 
 delivery_date=
   split_part(delivery_date,'-',1)
   ||'-'||
   split_part(delivery_date,'-',3)
   ||'-'||
   split_part(delivery_date,'-',2)
where (delivery_date='2025-05-12' and order_date='2025-11-26')or (delivery_date='2025-04-07' and order_date='2025-06-10')
or (delivery_date='2026-01-06' and order_date='2026-05-27') or (delivery_date='2025-02-06' and order_date='2025-05-30')
or (delivery_date='2025-04-05' and order_date='2025-04-07') or (delivery_date='2026-01-05' and order_date='2026-04-13')
or (delivery_date='2025-05-09' and order_date='2025-05-21') or (delivery_date='2025-03-06' and order_date='2025-05-14')
or (delivery_date='2025-02-04' and order_date='2025-03-21') or (delivery_date='2026-03-04' and order_date='2026-04-02')
or (delivery_date='2025-04-08' and order_date='2025-07-25') or (delivery_date='2025-08-11' and order_date='2025-10-19');

update sale_cars
set 
 order_date=
   split_part(order_date,'-',1)
   ||'-'||
   split_part(order_date,'-',3)
   ||'-'||
   split_part(order_date,'-',2)
where (delivery_date='2025-06-07' and order_date='2025-09-05')or (delivery_date='2025-07-11' and order_date='2025-08-07')
or (delivery_date='2026-05-25' and order_date='2026-06-05') or (delivery_date='2026-05-08' and order_date='2026-11-04')
or (delivery_date='2025-04-30' and order_date='2025-04-10') or (delivery_date='2025-09-26' and order_date='2025-11-09')
or (delivery_date='2025-01-17' and order_date='2025-11-01') or (delivery_date='2026-04-28' and order_date='2026-09-03')
or (delivery_date='2025-01-13' and order_date='2025-05-01') or (delivery_date='2025-01-05' and order_date='2025-02-01')
or (delivery_date='2025-03-17' and order_date='2025-04-30') or (delivery_date='2025-09-03' and order_date='2025-09-17')
or (delivery_date='2025-04-30' and order_date='2025-09-04') or (delivery_date='2026-04-30' and order_date='2026-10-04')
or (delivery_date='2026-01-20' and order_date='2026-12-01') or (delivery_date='2025-07-14' and order_date='2025-10-07')
or (delivery_date='2025-02-15' and order_date='2025-12-02') or (delivery_date='2026-02-11' and order_date='2026-12-01')
or (delivery_date='2026-01-18' and order_date='2026-04-01') or (delivery_date='2026-01-29' and order_date='2026-09-01')
or (delivery_date='2026-05-31' and order_date='2026-06-03') ;

update sale_cars
set 
 order_date=
   split_part(order_date,'-',1)
   ||'-'||
   split_part(order_date,'-',3)
   ||'-'||
   split_part(order_date,'-',2)
where (delivery_date='2025-04-30' and order_date='2025-10-04')
or (delivery_date='2026-04-04' and order_date='2026-10-03')
or (delivery_date='2025-17-09' and order_date='2025-09-03');

update sale_cars
set 
 delivery_date=
   split_part(order_date,'-',1)
   ||'-'||
   split_part(order_date,'-',3)
   ||'-'||
   split_part(order_date,'-',2)
where (delivery_date='2025-09-03' and order_date='2025-17-09');

select order_id,customer_age
from sale_cars ;--where customer_age=NULL;--or order_date='2025-10-27';
select * from sale_cars; 
update sale_cars
set units_sold=NULL
where units_sold='Unknown';

select unit_cost,unit_sellingprice,delivery_fee,logistics_cost
from sale_cars;

select * from sale_cars 
where abs(unit_cost::numeric)>=100000000
or abs(unit_sellingprice::numeric)>=100000000
or abs(delivery_fee::numeric)>=100000000
or abs(logistics_cost::numeric)>=100000000;

alter table gari 
alter column unit_cost type numeric(15,2),
alter column unit_sellingprice type numeric(15,2),
alter column delivery_fee type numeric(15,2),
alter column logistics_cost type numeric(15,2);

select * from ggari;
select unit_sellingprice,
discount,delivery_fee,
revenue_recorded,
((unit_sellingprice-(unit_sellingprice*discount))+delivery_fee)*units_sold as calc_revenue
from ggari;

select units_sold,count(*) from ggari;
select customer_rating,
string_agg(distinct car_make,','order by car_make) as rates
from ggari
group by customer_rating
order by customer_rating;

--select revenue_recorded,units_sold,unit_sellingprice,delivery_fee,discount from ggari where revenue_recorded is null;
select -- units_sold,unit_sellingprice,
--discount,delivery_fee,
revenue_recorded,
((unit_sellingprice*(1-discount))+delivery_fee)*units_sold as calc_revenue,
((unit_sellingprice*(1-discount))*units_sold) - revenue_recorded as diff,
logistics_cost
from g_gari where payment_status='Completed';
select distinct payment_status from ggari;
select car_make,sum(revenue_recorded)
from ggari
group by car_make;

select car_model,(sum(units_sold))
from ggari
group by car_model;

select order_id,order_date,delivery_date, (delivery_date-order_date) as del_timedays,region,branch,car_make
from g_gari
where (delivery_date-order_date)>=100;

CREATE OR REPLACE VIEW clean_cars AS
SELECT *,
    TO_CHAR(departure_date, 'YYYY-MM')    AS travel_month,
    TO_CHAR(departure_date, 'Month YYYY') AS month_label,
    TO_CHAR(departure_date, 'Day')        AS day_name,
    EXTRACT(MONTH FROM departure_date)    AS month_num,
    EXTRACT(DOW FROM departure_date)      AS day_of_week,
    (fare_per_seat * seats_booked)           AS calculated_fare;
--car1086,d  lcl1170,d 0rd 1187
--car1160,o  lcl1128,d   ord1142,d,ord1115,d   lcl1116,d    ord1133,d
--ord1008,d   lcl1071,o   ord1068,o,ord1068,o   lcl1056,d   ord1008,d,lcl1275,d   lcl1011,o
select * from sale_cars;--2026-03-16,2026-09-04(d),2025-01-25,2025-06-02(d),2025-05-16,2025-07-06(d),2025-02-06,2025-05-17(o)
               --*2025-02-21,2025-10-05(d),2025-01-08,2025-08-29(o),*2025_04-11,2025-06-05(d),*2026-03-21,2026-09-04(d)
               --*2025-03-26,2025-06-04(d),*2025-03-23,2025-09-04(d),*2026-06-19,2026-11-07(d),*2025_04-03,2025-12-04(d)
               --2025-07-11,2025-11-11(o),*2025-05-21,2025-09-05(d),2026-03-13,2026-09-04(d),*2025-08-07,2025-11-08(d)
               --2026-01-21,2026-11-02(d),*2026-06-06,2026-10-06(d),2026-04-24,2026-11-05(d),2025-01-09,2025-11-09(o,d)
              --2026-05-04,2026-07-04(o,d)
update sale_cars
set 
 delivery_date=
   split_part(delivery_date,'-',1)
   ||'-'||
   split_part(delivery_date,'-',3)
   ||'-'||
   split_part(delivery_date,'-',2)
where (delivery_date='2026-09-04' and order_date='2026-03-16')or (delivery_date='2025-06-02' and order_date='2025-01-25')
or (delivery_date='2025-07-06' and order_date='2025-05-16') or (delivery_date='2025-10-05' and order_date='2025-02-21')
or (delivery_date='2025-09-04' and order_date='2025-03-23') or (delivery_date='2025-06-05' and order_date='2025-04-11')
or (delivery_date='2026-09-04' and order_date='2026-03-21') or (delivery_date='2025-06-04' and order_date='2025-03-26')
or (delivery_date='2025-09-05' and order_date='2025-05-21') or (delivery_date='2025-12-04' and order_date='2025-04-03')
or (delivery_date='2026-11-07' and order_date='2026-06-19') or (delivery_date='2025-08-07' and order_date='2025-11-08')
or (delivery_date='2026-11-02' and order_date='2026-01-21') or (delivery_date='2026-10-06' and order_date='2026-06-06')
or (delivery_date='2026-11-05' and order_date='2026-04-24') or (delivery_date='2025-11-09' and order_date='2025-01-09')
or (delivery_date='2026-07-04' and order_date='2026-05-04') ;

update sale_cars
set 
 order_date=
   split_part(order_date,'-',1)
   ||'-'||
   split_part(order_date,'-',3)
   ||'-'||
   split_part(order_date,'-',2)
where (delivery_date='2026-07-04' and order_date='2026-05-04')or (delivery_date='2025-05-17' and order_date='2025-02-06')
or (delivery_date='2025-08-29' and order_date='2025-01-08') or (delivery_date='2025-11-11' and order_date='2025-07-11')
or (delivery_date='2025-11-09' and order_date='2025-01-09');

select*from g_gari;
where order_date='2025-01-09';
update g_gari
set order_date=date '2025-07-03'
where order_date=date '2025-03-07' and delivery_date=date '2025-07-08';

select car_make,avg(delivery_date-order_date) as delivery_diff
from g_gari
group by car_make
order by delivery_diff desc;

select  order_date,delivery_date
from g_gari 
where order_id='Ord1210';
update g_gari
set order_date=delivery_date,
delivery_date=order_date
where order_id in ('Lcl1236','Lcl1167','Lcl1260','Lcl1242','Lcl1080','Lcl1081','Car1219','Ord1269');
update g_gari
set order_date=delivery_date,
delivery_date=order_date
where order_id in ('Lc1260','Lc1081','Ord1210');

select payment_status,sum(revenue_recorded) as rev_sum
from g_gari
group by payment_status
order by rev_sum desc;

select (unit_cost*units_sold)+logistics_cost as ttl_cost,
revenue_recorded-(unit_cost*units_sold)+logistics_cost as prof,
((unit_sellingprice-(unit_sellingprice*discount))+delivery_fee)*units_sold as calc_revenue
from g_gari;
select order_id,revenue_recorded from g_gari
where order_id='Lcl1014';
CREATE OR REPLACE VIEW clean_gari AS
SELECT *,
    TO_CHAR(order_date, 'YYYY-MM')    AS travel_month,
    TO_CHAR(order_date, 'Month YYYY') AS month_label,
    TO_CHAR(order_date, 'Day')        AS day_name,
    EXTRACT(MONTH FROM order_date)    AS month_num,
    EXTRACT(DOW FROM order_date)      AS day_of_week,
    ((unit_sellingprice-(unit_sellingprice*discount))+delivery_fee)*units_sold as calc_revenue
    FROM g_gari
WHERE payment_status = 'Completed';
select * from clean_gari;
select sum(units_sold) from clean_gari; --234 
select sum(revenue_recorded) from clean_gari; --849346199
select sum(revenue_recorded-(unit_cost*units_sold)+logistics_cost) as prof,
sum((revenue_recorded*100)/(revenue_recorded-(unit_cost*units_sold)+logistics_cost)) as gprof_margin
from clean_gari; --profit=76091530   gpmargin=249115.2043727222
select car_make,sum(revenue_recorded) from clean_gari
group by car_make; --Mitsubishi
select car_model,sum(units_sold) from clean_gari
group by car_model
order by sum(units_sold) desc; --Landcruiser Prado=26
select vehicle_type ,sum(revenue_recorded),sum(units_sold)
from clean_gari
group by vehicle_type
order by sum(revenue_recorded) desc;-- , sum(units_sold) desc;=--SUV 462207682  86 units sold
select branch ,sum(revenue_recorded)
from clean_gari
where payment_status = 'Completed'
group by branch
order by sum(revenue_recorded) desc; ---Kakamega 140279994
select region,county ,sum(revenue_recorded)
from clean_gari
where payment_status = 'Completed'
group by region,county
order by sum(revenue_recorded) desc; --Western Kakamega
select sales_rep ,sum(revenue_recorded),sum(units_sold)
from clean_gari
where payment_status = 'Completed'
group by sales_rep
order by sum(revenue_recorded) desc;-- Mary Wanjiku 138184869 33 units_sold
select lead_source ,sum(revenue_recorded)
from clean_gari
where payment_status = 'Completed'
group by lead_source
order by sum(revenue_recorded) desc;---instagram 147098719
SELECT
    EXTRACT(month FROM order_date::date) AS month,
    sum(revenue_recorded-(unit_cost*units_sold)+logistics_cost) as prof,
    sum(units_sold),
    sum(revenue_recorded) AS ttl_rev
FROM clean_gari
GROUP BY EXTRACT(month FROM order_date::date)
ORDER BY ttl_rev DESC; --April has the highest profit made and revenue-recorded with 29 units sold
select EXTRACT(month FROM order_date::date) AS month,count(*)
from clean_gari
GROUP BY EXTRACT(month FROM order_date::date)
order by EXTRACT(month FROM order_date::date);
select payment_method,sum(revenue_recorded) as reve
from clean_gari
group by payment_method
order by reve desc;---200453026 Cash
select payment_status,sum(revenue_recorded),count(*)
from g_gari
--where order_id!='Unknown'
group by payment_status
order by sum(revenue_recorded) desc;
select delivery_status ,count(*) as del
from clean_gari
group by delivery_status
order by del desc;--delivered 92 counts
select region,branch,car_make,avg(delivery_date - order_date) as time_diff 
from clean_gari
group by region,branch,car_make
order by time_diff desc;

select branch,logistics_cost,(logistics_cost/revenue_recorded)*100 as log_percentage
from clean_gari
--where branch='Eldoret'
order by log_percentage;

select car_make,car_model,
sum((revenue_recorded-(unit_cost*units_sold)+logistics_cost)/(revenue_recorded))*100 as gprof_margin
from clean_gari 
group by car_make,car_model;
select customer_type,sum(revenue_recorded) as revt
from clean_gari 
group by customer_type
order by revt; --Dealer 230015419
select distinct customer_name from clean_gari
where payment_method='Cash';

select distinct customer_name,sum(revenue_recorded) as rev
from clean_gari
where revenue_recorded is not null
group by customer_name 
order by rev desc
limit 10;

select car_make,car_model,count(*) as car_count
from clean_gari
where returned='Returned' or payment_status='Cancelled'
group by car_make,car_model 
order by car_count desc;

select car_make,vehicle_year,customer_rating,count(*)
from clean_gari
where customer_rating is not null
group by car_make,vehicle_year,customer_rating
order by customer_rating desc;
select discount, sum(revenue_recorded) as rev
from clean_gari
where discount is not null
group by discount
order by rev desc;

WITH monthly_revenue AS (
	SELECT 
		date_trunc('month', order_date) AS MONTH,
		sum(revenue_recorded) AS revenue,
		count(DISTINCT order_id) AS orders
	FROM clean_gari 
	GROUP BY date_trunc('month', order_date)
),
-- Write a CTE to calculate monthly growth
monthly_growth AS (
	SELECT 
		MONTH,
		revenue,
		lag(revenue) OVER (ORDER BY month) AS prev_monthly_revenue,
		round(((revenue - lag(revenue) OVER (ORDER BY month)) / lag(revenue) OVER (ORDER BY month)) 
		* 100, 2) AS growth_pct
	FROM monthly_revenue
)
SELECT 
	to_char(MONTH, 'YYYY-MM') AS month_label,
	revenue,
	growth_pct,
	rank() OVER (ORDER BY revenue desc) AS rank_month
FROM monthly_growth
ORDER BY MONTH;

WITH region_cancels AS (
    SELECT
        branch,
        COUNT(*) AS total_orders,
        COUNT(*) FILTER (WHERE payment_status IN ('Cancelled', 'Pending','Refunded','Unpaid')) AS cancelled_orders,
        SUM(revenue_recorded) FILTER (WHERE payment_status IN ('Cancelled', 'Pending','Refunded','Unpaid')) AS lost_revenue
    FROM g_gari
    GROUP BY region,county,branch
)
SELECT
    branch,
    total_orders,
    cancelled_orders,
    ROUND(cancelled_orders * 100.0 / total_orders, 2) AS cancellation_rate_pct,
    lost_revenue
FROM region_cancels
ORDER BY cancellation_rate_pct DESC;

-- Total lost revenue across all routes
SELECT
    SUM(revenue_recorded) AS total_lost_revenue
FROM g_gari
WHERE payment_status IN ('Cancelled', 'Pending','Refunded','Unpaid');--634737367
	
select distinct payment_status FROM g_gari;
SELECT
    EXTRACT(MONTH FROM order_date::date) as month_ordered,
    EXTRACT(DOW FROM order_date::date) as day_ordered,
    COUNT(*) AS total_orders
FROM clean_gari
GROUP BY EXTRACT(month FROM order_date::date),EXTRACT(DOW FROM order_date::date)
ORDER BY total_orders DESC;

--What are our busiest times?
--Answer;
select
	day_name,
    EXTRACT(month FROM order_date::date) AS month_ordered,
    COUNT(*) AS total_orders,
    sum(units_sold) as total_cars
FROM clean_gari
GROUP BY day_name, EXTRACT(month FROM order_date::date)
ORDER BY total_cars DESC;
select
	day_name,sum(units_sold) as total_cars,COUNT(*) AS total_orders
FROM clean_gari
GROUP BY day_name
ORDER BY total_cars DESC;

select
	TO_CHAR(order_date,'FMMonth') as month_name,sum(units_sold) as total_cars,COUNT(*) AS total_orders
FROM clean_gari
GROUP BY TO_CHAR(order_date,'FMMonth')
ORDER BY total_cars desc;

select CORR(discount,revenue_recorded) as correlation
FROM clean_gari;
select CORR(customer_rating,revenue_recorded) as revenue_correlation,
       CORR(customer_rating,units_sold) as units_correlation
FROM clean_gari;

select distinct delivery_status FROM clean_gari;
select delivery_status,sum(revenue_recorded) as rev 
FROM g_gari
where payment_status in ('Cancelled','Pending','Refunded','Unpaid')
group by delivery_status;
--Creating a view on monthly growth by revenue
CREATE OR REPLACE VIEW monthly_pctgrowth AS
WITH monthly_revenue AS (
	SELECT 
		date_trunc('month', order_date) AS MONTH,
		sum(revenue_recorded) AS revenue,
		count(DISTINCT order_id) AS orders
	FROM clean_gari 
	GROUP BY date_trunc('month', order_date)
),
-- Write a CTE to calculate monthly growth
monthly_growth AS (
	SELECT 
		MONTH,
		revenue,
		lag(revenue) OVER (ORDER BY month) AS prev_monthly_revenue,
		round(((revenue - lag(revenue) OVER (ORDER BY month)) / lag(revenue) OVER (ORDER BY month)) 
		* 100, 2) AS growth_pct
	FROM monthly_revenue
)
SELECT 
	to_char(MONTH, 'YYYY-MM') AS month_label,
	revenue,
	growth_pct,
	rank() OVER (ORDER BY revenue desc) AS rank_month
FROM monthly_growth
ORDER BY MONTH;
--Cancellation that affected revenue
CREATE OR REPLACE VIEW cancelled_analysis AS
WITH region_cancels AS (
    SELECT
        branch,
        COUNT(*) AS total_orders,
        COUNT(*) FILTER (WHERE payment_status IN ('Cancelled', 'Pending','Refunded','Unpaid')) AS cancelled_orders,
        SUM(revenue_recorded) FILTER (WHERE payment_status IN ('Cancelled', 'Pending','Refunded','Unpaid')) AS lost_revenue
    FROM g_gari
    GROUP BY region,county,branch
)
SELECT
    branch,
    total_orders,
    cancelled_orders,
    ROUND(cancelled_orders * 100.0 / total_orders, 2) AS cancellation_rate_pct,
    lost_revenue
FROM region_cancels
ORDER BY cancellation_rate_pct DESC;

--Sales representatives by performance
CREATE OR REPLACE VIEW sales_rep_performance AS
WITH sales_rep_stats AS (
    SELECT
        sales_rep,
        COUNT(DISTINCT order_id) AS total_completed_orders,
        SUM(revenue_recorded) AS total_revenue,
        SUM(units_sold) as total_units,
        ROUND(AVG(customer_rating), 2) AS avg_customer_rating,
       CORR(customer_rating, units_sold) AS correlation
    from clean_gari
    WHERE payment_status = 'Completed'
     AND customer_rating IS NOT NULL
    GROUP BY sales_rep
)
SELECT
    sales_rep,
    total_completed_orders,
    total_revenue,
    total_units,
    avg_customer_rating,
    correlation
FROM sales_rep_stats
ORDER BY total_revenue DESC;

--Performance by car_makes and models
CREATE OR REPLACE VIEW car_performance AS
SELECT
    car_make,
    car_model,
    vehicle_type,
    COUNT(*)                              AS total_orders,
    SUM(units_sold)                   AS total_cars,
    SUM(revenue_recorded)                     AS total_revenue,
    ROUND(AVG(unit_sellingprice), 2)     AS avg_sellingprice,    
    ROUND(AVG(customer_rating), 2)       AS avg_rating
FROM clean_gari
GROUP BY car_make,car_model,vehicle_type
ORDER BY total_revenue DESC;
--order count by region,county,branch
CREATE OR REPLACE VIEW regional_performance AS
SELECT
    region,county,branch,
    COUNT(DISTINCT order_id) AS orders,
    SUM(revenue_recorded) AS revenue
FROM clean_gari
WHERE payment_status = 'Completed'
GROUP BY region,county,branch
ORDER BY orders DESC
LIMIT 10;

CREATE INDEX idx_g_gari_orddate     ON g_gari (order_date);
CREATE INDEX idx_g_gari_car       ON g_gari (car_make);
CREATE INDEX idx_g_gari_srep      ON g_gari (sales_rep);
CREATE INDEX idx_g_gari_pstatus      ON g_gari (payment_status);
CREATE INDEX idx_g_gari_payment     ON g_gari (payment_method);
CREATE INDEX idx_g_gari_vehicle     ON g_gari (vehicle_type);
CREATE INDEX idx_g_gari_model     ON g_gari (car_model);
CREATE INDEX idx_g_gari_regon    ON g_gari (region);
CREATE INDEX idx_g_gari_brnch    ON g_gari (branch);
CREATE INDEX idx_g_gari_dstatus    ON g_gari (delivery_status);
CREATE INDEX idx_g_gari_cnty     ON g_gari (county);

SELECT tablename, indexname FROM pg_indexes
WHERE schemaname = 'j_cars';

--create view gross_prof_analysis as
select order_id,revenue_recorded,unit_cost,units_sold,logistics_cost,delivery_fee,(unit_cost*units_sold) as goods_cost,
       revenue_recorded-((unit_cost*units_sold)+logistics_cost+delivery_fee) as gross_profit,
case
	when revenue_recorded=0 then null
	else (
	  (revenue_recorded-((unit_cost*units_sold)+logistics_cost+delivery_fee))/revenue_recorded)*100
end as gross_profit_margin
from clean_gari;


drop view if exists cancellation_analysis;
