___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Piwik Consents Status",
  "categories": ["UTILITY"],
  "description": "A template to get the user consent preferences when using Piwik Consent Manager solution as a string stored in a variable.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//Get localstorage values
const log = require('logToConsole');
const localStorage = require('localStorage');
const JSON = require('JSON');

//Access to consents
var piwik_ls = localStorage.getItem('ppms_webstorage');
var piwik_json = JSON.parse(piwik_ls);
var piwik_object_json = JSON.parse(piwik_json[0].value);
var piwik_consents = piwik_object_json.consents;


var consent_status = ',';
if(piwik_consents.ab_testing_and_personalization){
  if (piwik_consents.ab_testing_and_personalization.status === 1){
    consent_status += 'ab_testing_and_personalization,';
    }
} else {
  if(piwik_consents.marketing_automation){

    if (piwik_consents.marketing_automation.status === 1){
      consent_status += 'marketing_automation,';
    }
  }
  else {
    if(piwik_consents.remarketing){
      if (piwik_consents.remarketing.status === 1){
        consent_status += 'remarketing,';
      }
    }
    else {
      if(piwik_consents.conversion_tracking){
        if (piwik_consents.conversion_tracking.status === 1){
          consent_status += 'conversion_tracking,';
        }
      }
      else {
        if(piwik_consents.analytics){
        if (piwik_consents.analytics.status === 1){
          consent_status += 'analytics';
          }
        }
      }
    }
  }
}

return consent_status;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_local_storage",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ppms_webstorage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 11/8/2023 7:59:32
