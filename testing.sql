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
  -- Extracting the applicationId and knownApplicationProductionPlatforms fields in one simple call
  jsonpath_record_selector = '$.applications[*].architecture.knownApplicationProductionPlatforms[*]',
  request_method = 'GET',
  return_format = 'JSON',
  target_uri_pattern = 'https://seal-api.gaiacloud.jpmchase.net/applications'
);
