
# Facebook Ads Stitch BigQuery

This is a fork of https://github.com/dbt-labs/facebook-ads. As of this writing,
the original implementation of this package doesn't support BigQuery. **This is
a modified version of the original package that works ONLY with BigQuery and Stitch.**

This package models Facebook Ads data.

[Here](https://developers.facebook.com/docs/marketing-api/using-the-api) is info
from Facebook's API.

# Installation Instructions

[Here](https://docs.getdbt.com/docs/package-management) is some additional 
information about packages in dbt, including installation instructions. 
If you haven't already, you will need to create a `packages.yml` file in your project.

You should then copy these variables into your root `dbt_project.yml`, and fill
in with the names of Facebook ads tables in your warehouse:
```
vars:

  etl:                                   #stitch or fivetran
  ads_table:                             #table
  ad_creatives_table:                    #table
  adsets_table:                          #table
  campaigns_table:                       #table
  ads_insights_table:                    #table

  url_tag_table:                         #only for fivetran
```

## Stitch

[Here](https://www.stitchdata.com/docs/integrations/saas/facebook-ads) 
is info about Stitch's Facebook Ads connector.
