*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem    

*** Test Cases ***
TC1
    Log To Console    D:${/}B-Mine${/}Company\\Company\\NCS\\AssignmentSelenium_5.docx  
    Log To Console    ${EXECDIR}\\files\\AssignmentSelenium_5.docx     
    Log To Console    ${EXECDIR}${/}files${/}AssignmentSelenium_5.docx 
    
 
TC2_Upload
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.naukri.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Choose File    xpath=//*[@id='file_upload']    D:\\B-Mine\\Company\\Company\\NCS\\AssignmentSelenium_5.docx
    
    Wait Until Page Contains    uploaded Successfully    50s    
    Page Should Contain    uploaded Successfully    
    
TC3_Upload
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.naukri.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Choose File    xpath=//*[@id='file_upload']    ${EXECDIR}${/}files${/}AssignmentSelenium_5.docx 
    
    Wait Until Page Contains    uploaded Successfully    50s    
    Page Should Contain    uploaded Successfully    
    



