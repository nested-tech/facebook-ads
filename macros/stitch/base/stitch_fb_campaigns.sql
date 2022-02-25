{% macro stitch_fb_ads_campaigns() %}

    {{ adapter.dispatch('stitch_fb_ads_campaigns', 'facebook_ads')() }}

{% endmacro %}


{% macro default__stitch_fb_ads_campaigns() %}

select

    nullif(id,'') as campaign_id,
    nullif(name,'') as name

from {{ stitch_base_table(var('campaigns_table')) }}

{% endmacro %}
