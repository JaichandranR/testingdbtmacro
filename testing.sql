CREATE TABLE IF NOT EXISTS apitables_prototype.seal_prototype.application_platform (
  applicationId varchar,
  platforms json
)
WITH (
  api_additional_headers = '{}',
  api_request_retry_settings = '{"retry":false,"attempts":5,"delaySeconds":15}',
  api_response_header_accept = 'application/json',
  -- Extract applicationId and the whole knownApplicationProductionPlatforms as JSON
  jsonpath_record_selector = 'AS_STRING:[{"applicationId":"$.applications[*].applicationId"},{"platforms":"$.applications[*].architecture.knownApplicationProductionPlatforms[*]"}]',
  request_method = 'GET',
  return_format = 'JSON',
  target_uri_pattern = 'https://seal-api.gaiacloud.jpmchase.net/applications'
);
