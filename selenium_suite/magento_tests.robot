*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_ValidCredential
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://magento.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    Click Element    link=My Account  
    Input Text    id=email    balaji0017@gmail.com   
    Input Password    id=pass    balaji@12345    
    Click Element    name=send  
    # wait until dashboard  page available
    Wait Until Page Contains Element    link=Log Out    50s
    Title Should Be    My Account    
    Click Element    link=Log Out      
 
