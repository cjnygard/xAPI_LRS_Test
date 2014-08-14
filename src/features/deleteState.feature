Feature: deleteState

Scenario:

    Given a [type] deleteState request cluster
    When the request is made on the primed LRS
    Then the deleteState response is verified

    Where:
        type
        typical

Scenario:

    Given a [type] deleteState request cluster
    Given all requests' [property] are set to [value]
    When the request is made on the primed LRS
    Then the deleteState response is verified

    Where:
        type       | property             | value
        typical    | stateId parameter    | test state id
        typical    | activityId parameter | test activity id
        typical    | agent parameter      | an mboxAndType agent
        typical    | agent parameter      | an mboxSha1AndType agent
        typical    | agent parameter      | an openidAndType agent
        typical    | agent parameter      | an accountAndType agent
        typical    | agent parameter      | an mboxOnly agent
        typical    | agent parameter      | an mboxSha1Only agent
        typical    | agent parameter      | an openidOnly agent
        typical    | agent parameter      | an accountOnly agent
        registered | stateId parameter    | test state id
        registered | activityId parameter | test activity id
        registered | agent parameter      | an mboxAndType agent
        registered | agent parameter      | an mboxSha1AndType agent
        registered | agent parameter      | an openidAndType agent
        registered | agent parameter      | an accountAndType agent
        registered | agent parameter      | an mboxOnly agent
        registered | agent parameter      | an mboxSha1Only agent
        registered | agent parameter      | an openidOnly agent
        registered | agent parameter      | an accountOnly agent

Scenario:

    Given a [type] deleteState request
    Given the [property] is removed
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type       | property
        400  | typical    | version header
        401  | typical    | authority header
        400  | typical    | activityId parameter
        400  | typical    | agent parameter
        400  | registered | version header
        401  | registered | authority header
        400  | registered | activityId parameter
        400  | registered | agent parameter

Scenario:

    Given a [type] deleteState request
    Given the [property] is set to [value]
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | property             | value
        400  | typical | resource             | activity/state
        400  | typical | resource             | activities/states
        400  | typical | version header       | bad version
        400  | typical | version header       | 3.8.0
        400  | typical | authority header     | Basic badAuth
        401  | typical | authority header     | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ

@Pending
Scenario:

    Given a [type] deleteState request
    Given the [property] is set to [value]
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | property             | value
        400  | typical | agent parameter      | an empty agent

Scenario:

    Given a [type] deleteState request
    Given the agent parameter is set to a [modifier] agent
    Given the params agent [property] is set to [value]
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | modifier        | property         | value
        400  | typical | mboxAndType     | mbox             | test@tincan.edu
        400  | typical | mboxAndType     | mbox             | bad mbox
        400  | typical | mboxAndType     | objectType       | notAgent
        400  | typical | mboxAndType     | objectType       | Activity
        400  | typical | mboxOnly        | mbox             | test@tincan.edu
        400  | typical | mboxOnly        | mbox             | bad mbox

@Pending
Scenario:

    Given a [type] deleteState request
    Given the agent parameter is set to a [modifier] agent
    Given the params agent [property] is set to [value]
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | modifier        | property         | value
        400  | typical | mboxAndType     | objectType       | agent
        400  | typical | openidAndType   | openid           | badURI
        400  | typical | accountAndType  | account homePage | badURI
        400  | typical | openidOnly      | openid           | badURI
        400  | typical | accountOnly     | account homePage | badURI


Scenario:

    Given a [type] deleteState request
    Given the agent parameter is set to a [modifier] agent
    Given the params agent [property] is set to removed
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | modifier        | property
        400  | typical | accountAndType  | account homePage
        400  | typical | accountAndType  | account name
        400  | typical | accountOnly     | account homePage
        400  | typical | accountOnly     | account name

@Pending
Scenario:

    Given a [type] deleteState request
    Given the agent parameter is set to a [modifier] agent
    Given the params agent [property] is set to removed
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | modifier        | property
        400  | typical | mboxAndType     | mbox
