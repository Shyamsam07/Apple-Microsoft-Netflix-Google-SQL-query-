use project2;
select *from stocks_google;
with t1 as
(select *,substr(date,4)as months ,max(open)as highest_opening  from stocks_google group by months),
t2 as
(select months,highest_opening from t1)
select *from t2;

select *from stocks_netflix;
with t1 as
(select *,substr(date,7)as years from stocks_netflix group by years),
t2 as
(select years,stddev(volume)from t1 group by years)
select *from t2;
with t1 as
(select *,substr(date,7)as years,stddev(volume)as std_per_year from stocks_netflix group by years)
select years,std_per_year from t1;


select *from stocks_apple;
select* from stocks_microsoft;

create view 
diffe as
(select m.open as microsoft_open,a.open as apple_open from stocks_microsoft m join stocks_apple a on
m.date=a.date );
select *from diff;
select *,microsoft_open-apple_open as difference from diffe;



select *from stocks_microsoft;

select *,close-open as daily_return from stocks_microsoft order by daily_return desc limit 1; 

select*from diffe;
select *,microsoft_open-apple_open as diffenece,
dense_rank()over(order by microsoft_open-apple_open desc)as 
rnk from diffe;



