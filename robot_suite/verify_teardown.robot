*** Settings ***
Documentation    This suite will handle all the test case related to 
...    the valid credentials - Jira issue id OEM-100

Resource    ../Resource/Base/CommonFunctionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource

Test Setup    Launch Browser
Test Teardown    End Browser

*** Test Cases ***
TC1
    Enter Username    admin    
    Enter Password    pass
    Select Language By Text    English (Indian)  
    Click Login  
    Validate Page Contains    Flow Board
    Mouseover On CurrentName
    Click Logout
    [Teardown]    NONE
    
TC2
    [Setup]    NONE
    Log To Console    bala    
    Log To Console    ${TEST_NAME}    
    Log To Console    ${SUITE_NAME}    
    [Teardown]    NONE
    