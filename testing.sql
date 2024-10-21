{{ config(
    materialized='incremental',
    incremental_strategy='merge'
) }}

WITH flattened_data AS (
    SELECT
        -- Extract applicationId
        json_extract_scalar(raw, '$.applicationId') AS applicationId,
        -- Use UNNEST to unnest the knownApplicationProductionPlatforms array
        platform.value ->> '$.platformCode' AS platformCode,
        platform.value ->> '$.sourceApplicationId' AS sourceApplicationId,
        platform.value ->> '$.lastDiscoveredDateTimeUTC' AS lastDiscoveredDateTimeUTC
    FROM {{ ref('raw_32010_application') }},
    -- Correct UNNEST to handle array of JSON objects
    UNNEST(json_parse(json_extract(raw, '$.architecture.knownApplicationProductionPlatforms'))) AS platform(value)
)

SELECT *
FROM flattened_data;
