{% macro generate_schema_name(custom_schema_name, node) -%}

{% set query_tag = {} %}
    {%- do query_tag.update(
        PROJECT_NAME=project_name,  
        BU='TST',
	    APP='dbt', 
        DBT_SNOWFLAKE_QUERY_TAGS_VERSION='2.5.0',
        THREAD_ID=thread_id,
        IS_INCREMENTAL=is_incremental()
    ) -%}
{% set query_tag_json = tojson(query_tag) %}
{% do run_query("alter session set query_tag = '{}'".format(query_tag_json)) %}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    {%- else -%}
       {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}