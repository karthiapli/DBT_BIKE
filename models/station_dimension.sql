with station as
(
    select
    START_STATION_ID,
    START_STATION_NAME,
    START_LATITUDE,
    START_LONGITUDE

    from {{ source('demo_schema', 'bike') }}
    where START_LATITUDE !='start_lat'

)

select * from station