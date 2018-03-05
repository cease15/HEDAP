*** Settings ***

Resource  cumulusci/robotframework/CumulusCI.robot
Resource  cumulusci/robotframework/Salesforce.robot
Suite Setup  Set Login Url
Suite Teardown  Close Browser

*** Keyword ***

Get Random Contact Info
    ${first_name} =  Generate Random String
    ${last_name} =  Generate Random String
    Set Test Variable  ${first_name}  ${first_name}
    Set Test Variable  ${last_name}  ${last_name}

*** Test Cases ***

Test Create Contact
    Open Test Browser
    Go To Object Home  Contact
    Click Object Button  New
    Get Random Contact Info
    Populate Form
    ...    First Name=${first_name}
    ...    Last Name=${last_name}
    Click Modal Button  Save
    Wait Until Loading Is Complete
    Capture Page Screenshot