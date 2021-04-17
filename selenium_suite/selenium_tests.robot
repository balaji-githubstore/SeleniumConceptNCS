*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_Windows
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${width}     ${height}    Get Window Size 
    Log To Console    ${width}  
    Log To Console    ${height}  
    
    Set Window Size    400    526      
    Go To    https://google.com/  
   
TC2_Screenshot
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    # Click Element At Coordinates    NONE    100    100
    Capture Element Screenshot    //*[@alt="Google"]    ${EXECDIR}\\files\\newlogo.png
    
TC2_CreateHtml
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${src}    Get Source   
    Log To Console    ${src}      
    
    Create File    ${EXECDIR}\\files\\google.html    
    Append To File    ${EXECDIR}\\files\\google.html    ${src}    

