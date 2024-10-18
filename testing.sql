CREATE TABLE IF NOT EXISTS apitables_prototype.seal_prototype.application_platform (
  applicationId varchar,
  platformCode varchar,
  sourceApplicationId varchar,
  associatedDeploymentId varchar,
  lastDiscoveredDateTimeUTC varchar
)
WITH (
  api_additional_headers = '{}',
  api_request_retry_settings = '{"retry":false,"attempts":5,"delaySeconds":15}',
  api_response_header_accept = 'application/json',
  -- Embed applicationId within each platform entry to ensure all fields are extracted
  jsonpath_record_selector = '$.applications[*].architecture.knownApplicationProductionPlatforms[*].{applicationId:$.applications[*].applicationId, platformCode:platformCode, sourceApplicationId:sourceApplicationId, associatedDeploymentId:associatedDeploymentId, lastDiscoveredDateTimeUTC:lastDiscoveredDateTimeUTC}',
  request_method = 'GET',
  return_format = 'JSON',
  target_uri_pattern = 'https://seal-api.gaiacloud.jpmchase.net/applications'
);
