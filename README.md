# testingdbtmacro
testingdbtmacro


  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode"},{"sourceApplicationId":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].sourceApplicationId"},{"associatedDeploymentId":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].associatedDeploymentId"},{"lastDiscoveredDateTimeUTC":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].lastDiscoveredDateTimeUTC"}]',

jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode"}]',


  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[*].platformCode"}]',


  jsonpath_record_selector = 'AS_MULTISTRING:[{"applicationId":"$.applications[*].applicationId"},{"platformCode":"$.applications[*].architecture.knownApplicationProductionPlatforms[?(@ != null)].platformCode"}]',
