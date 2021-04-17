*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_ValidCredential
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://netbanking.hdfcbank.com/netbanking/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    10s
    # Select Frame    xpath=//frame[contains(@src,'RSLogin')]
    Select Frame    name=login_page
    
    Input Text    xpath=//input[@name='fldLoginUserId']    test123    
    #click on continue
    # Click Element    //img[@alt='continue']    
    Click Element    //input[@name='fldLoginUserId']/following::img  
      
    Unselect Frame
    