*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem    
Library    AutoItLibrary        

*** Test Cases *** 
TC1_WindAuthUrl
    # http://Username:Password@SiteURL
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=http://demo.guru99.com/test/basic_auth.php    browser=CHROME
    Sleep    1s 
    Send    guru99
    Sleep    1s    
    Send    {ENTER}
    Sleep    1s    
    Send    guru99
    Sleep    1s    
    Send    {ENTER}
    
TC2_UploadUsingAutoIT
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.naukri.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Click Element    xpath=//*[contains(text(),'Upload CV')]
    
    Sleep    2s    
    Control Focus    Open    ${EMPTY}    Edit1
    Sleep    2s    
    Control Set Text    Open    ${EMPTY}    Edit1    D:\\B-Mine\\Company\\Company\\NCS\\AssignmentSelenium_4.docx    
    Sleep    2s        
    Control Click    Open     ${EMPTY}    Button1
    # Send    {ENTER}
    Wait Until Page Contains    uploaded Successfully    50s    
    Page Should Contain    uploaded Successfully 




