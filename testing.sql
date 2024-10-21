WITH flattened_data AS (
    SELECT
        -- Extract applicationId
        json_extract_scalar(raw, '$.applicationId') AS applicationId,
        -- Unnest knownApplicationProductionPlatforms and extract fields
        platform.platformCode,
        platform.sourceApplicationId,
        platform.lastDiscoveredDateTimeUTC
    FROM {{ ref('raw_32010_application') }},
    -- Use UNNEST to unnest the array
    UNNEST(cast(json_parse(json_extract(raw, '$.architecture.knownApplicationProductionPlatforms')) AS array(map(varchar, varchar)))) AS platform
)

SELECT *
FROM flattened_data;
