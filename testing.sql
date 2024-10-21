{{ config(
    materialized='table',
    file_format='PARQUET',
    on_table_exists='drop'
) }}

WITH flattened_data AS (
    SELECT
        -- Extract applicationId
        json_extract_scalar(raw, '$.applicationId') AS applicationId,
        -- Unnest knownApplicationProductionPlatforms and extract fields
        json_extract_scalar(platform.value, '$.platformCode') AS platformCode,
        json_extract_scalar(platform.value, '$.sourceApplicationId') AS sourceApplicationId,
        json_extract_scalar(platform.value, '$.lastDiscoveredDateTimeUTC') AS lastDiscoveredDateTimeUTC
    FROM {{ ref('raw_32010_application') }},
    -- Use CROSS JOIN UNNEST to unnest the platforms array
    UNNEST(json_parse(json_extract(raw, '$.architecture.knownApplicationProductionPlatforms'))) AS platform
)

SELECT *
FROM flattened_data;

