*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_DisableNotifications
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.redbus.in/    browser=CHROME    options=add_argument("--disable-notifications")
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    

TC2_HeadlessUsingOptions
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME    options=add_argument("--disable-notifications");add_argument("--Headless")
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    #print the firstname
    ${name1}    Get Text    //table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}    
    
    ${name2}    Get Text    //table[@id='example']/tbody/tr[2]/td[2]
    Log To Console    ${name2} 
    
TC3_HeadlessffUsingOptions
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=ff    options=add_argument("--disable-notifications");add_argument("--Headless")
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    #print the firstname
    ${name1}    Get Text    //table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}    
    
    ${name2}    Get Text    //table[@id='example']/tbody/tr[2]/td[2]
    Log To Console    ${name2} 
    
TC4_Headless
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=headlesschrome
    ...    options=add_argument("--disable-notifications");add_argument("--Headless");add_argument("--ignore-certificate-errors")
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    #print the firstname
    ${name1}    Get Text    //table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}    
    
    ${name2}    Get Text    //table[@id='example']/tbody/tr[2]/td[2]
    Log To Console    ${name2} 