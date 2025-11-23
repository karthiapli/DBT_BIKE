with CTE as
(
    select 
         to_timestamp(started_at) as started_at,
         date(to_timestamp(started_at)) as started_date,
         month(to_timestamp(started_at)) as started_month,
         day (to_timestamp(started_at)),
         dayname (to_timestamp(started_at)),
        {{function2('started_at')}} as day_type1,
        {{function1('started_at')}} as Month_type1
    from {{ source('demo_schema', 'bike') }}
    where started_at != 'started_at'

    
)

select
* from CTE

