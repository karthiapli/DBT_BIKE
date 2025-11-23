with trips as (
    select 
    RIDE_ID ,
	RIDEABLE_TYPE ,
	START_STATION_ID ,
	END_STATION_ID ,
	MEMBER_OR_CASUAL_RIDE,
    TIMESTAMPDIFF (SECONDS,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) as Trip_duration_seconds
    from {{ source('demo_schema', 'bike') }}
    WHERE STARTED_AT !='started_at'
    )

select * from trips