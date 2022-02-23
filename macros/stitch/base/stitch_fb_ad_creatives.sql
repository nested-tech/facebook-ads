{% macro stitch_fb_ad_creatives() %}

    {{ adapter.dispatch('stitch_fb_ad_creatives', 'facebook_ads')() }}

{% endmacro %}


{% macro default__stitch_fb_ad_creatives() %}

with base as (

    select * from {{ stitch_base_table(var('ad_creatives_table')) }}

),

links_joined as (

    select

        id as creative_id,

        lower(coalesce(
          nullif({{ facebook_ads.nested_field('base.object_story_spec', ['link_data', 'call_to_action', 'value', 'link']) }}, ''),
          nullif({{ facebook_ads.nested_field('base.object_story_spec', ['video_data', 'call_to_action', 'value', 'link']) }}, ''),
          nullif({{ facebook_ads.nested_field('base.object_story_spec', ['link_data', 'link']) }}, '')
        )) as url,

        lower(coalesce(
            nullif(url_tags, {{ dbt_utils.split_part('url', "'?'", 2) }}), '')
        ) as url_tags

    from base

),

parsed as (

    select

        links_joined.*,
        {{ dbt_utils.split_part('url', "'?'", 1) }} as base_url,
        {{ dbt_utils.get_url_host('url') }} as url_host,
        {{ dbt_utils.concat(["'/'", dbt_utils.get_url_path('url')]) }} as url_path,
        {{ facebook_ads.get_url_parameter() }}

    from links_joined

)

select * from parsed

{% endmacro %}
