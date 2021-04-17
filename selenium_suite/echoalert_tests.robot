*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_HandleAlert
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=http://www.echoecho.com/javascript4.htm    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Sleep    3s    
    Click Element    name=B2  
    Sleep    2s    
    ${msg}    Handle Alert    LEAVE    timeout=30s        
    Log To Console    ${msg}    
    Log    ${msg}    
    Alert Should Be Present    text=Confirm boxes offer the user a choice of clicking OK or Cancel123    action=ACCEPT    timeout=30s 
    Reload Page
    
TC2_HandleAlert
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=http://www.echoecho.com/javascript4.htm    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Sleep    3s    
    Click Element    name=B2  
    Handle Alert    
     
TC3_HandleAlert
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=http://www.echoecho.com/javascript4.htm    browser=FF
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Sleep    3s    
    Click Element    name=B3
    ${msg}    Handle Alert    LEAVE    30s   
    Log To Console    ${msg}    
    Input Text Into Alert    balaji    LEAVE    30s
    Sleep    3s    
    Handle Alert    ACCEPT







