with daily_weather as
(
    select 
    * 
    from {{ source('demo_schema', 'weather') }}

),

daily_weather_agg as 
(
select 
date(time) as daily_weather,
weather,
count(weather),
ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather)) AS row_number,
round(avg(TEMP),2) as AVG_TMP,
round(avg(pressure),2) as AVG_PRESURE,
from daily_weather
group by daily_weather,weather
--qualify row_number() over (partition by daily_weather order by count(weather) desc) in (1,2)
order by daily_weather desc

)


select 
* from 
daily_weather_agg

