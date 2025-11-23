{% macro function1(a) %}

case

    when {{a}} < current_date
    then 'PAST'
    when {{a}} = current_date
    then 'PRESENT'
    else 'FUTURE'

end 
{% endmacro %}

{%macro function2(a)%}

case
    when {{a}} in ('Sat','Sun')
    then 'Weenend'
    else 'Weekday'
end 

{% endmacro%}

