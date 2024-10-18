{% set include_cols = [] %}
-- execute the query to get the key values from within JSON object to be used for subsequent query building
-- call statement('get_query_results', fetch_result=True, auto_begin=False) -%}

{{ unnest_firstrow_query }}

-- endcall -%}

{% set sql_results = {} %}
{% set sql_select_clause = '' %}
{% set sql_select_clause_list = [] %}
{% set part_select_clause = '' %}

-- Assume we have a helper method `is_scalar` that determines whether a field is scalar (string, number, boolean)
{% macro is_scalar(data_type) %}
    {{ data_type in ['string', 'number', 'boolean'] }}
{% endmacro %}

{% if execute %}
  {% set sql_results_table = load_result('get_query_results').table.columns %}
  
  {% for column_name, column in sql_results_table.items() %}
    {% do sql_results.update({column_name: column.values()}) %}
  {% endfor %}

  {% for column_name, column_value in sql_results.items() %}
    -- Determine whether to use json_extract_scalar or json_query based on the data type
    {% if is_scalar(column_value['type']) %}
      -- Use json_extract_scalar for scalar types
      {% set part_select_clause = 'json_extract_scalar(' ~ column_name ~ ', ' ~ "'$.AssetDetails." ~ column_value ~ "')" ~ ' AS ' ~ column_name %}
    {% else %}
      -- Use json_query for arrays or objects
      {% set part_select_clause = 'json_query(' ~ column_name ~ ', ' ~ "'strict $.AssetDetails." ~ column_value ~ "' OMIT QUOTES)" %}
    {% endif %}
    
    {% do sql_select_clause_list.append(part_select_clause) %}
  {% endfor %}
{% endif %}

{% set sql_select_clause = sql_select_clause_list | join(', ') %}

{{ return(sql_select_clause) }}
