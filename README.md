# testingdbtmacro
testingdbtmacro


  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode"},{"sourceApplicationId":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].sourceApplicationId"},{"associatedDeploymentId":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].associatedDeploymentId"},{"lastDiscoveredDateTimeUTC":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].lastDiscoveredDateTimeUTC"}]',

jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode"}]',


  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode"}]',


  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[?(@ != null)].platformCode"}]',

  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"architecture":"$.applications[*].architecture"}]',


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
  jsonpath_record_selector = '$.applications[*].applicationId, $.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode, $.applications[*].architecture.knownApplicationProductionPlatforms[*].sourceApplicationId, $.applications[*].architecture.knownApplicationProductionPlatforms[*].associatedDeploymentId, $.applications[*].architecture.knownApplicationProductionPlatforms[*].lastDiscoveredDateTimeUTC',
  request_method = 'GET',
  return_format = 'JSON',
  target_uri_pattern = 'https://seal-api.gaiacloud.jpmchase.net/applications'
);
