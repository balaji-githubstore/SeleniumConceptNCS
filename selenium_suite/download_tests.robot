*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC_Username
    ${currentusername}    Get Environment Variable    USERNAME    
    Log To Console    ${currentusername}  
    Log To Console    ${EXECDIR}${/}downloads     
    

TC1_DefaultDownloadDir
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.selenium.dev/downloads/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Click Element    link=32 bit Windows IE    
    Sleep    10s
    ${currentusername}    Get Environment Variable    USERNAME  
    # C:\Users\JiDi\Downloads\IEDriverServer_Win32_3.150.1.zip    
    File Should Exist    C:\\Users\\${currentusername}\\Downloads\\IEDriverServer_Win32_3.150.1.zip   

TC2_ChangeDownloadDir    
    ${prefs}    Create Dictionary    download.default_directory=D:\\B-Mine\\Company\\Company\\NCS\\robot_workspace\\RobotSeleniumConcept\\downloads    
    
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.selenium.dev/downloads/    browser=CHROME    options=add_experimental_option("prefs",${prefs})
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Click Element    link=32 bit Windows IE    
    Sleep    10s 
    File Should Exist    D:\\B-Mine\\Company\\Company\\NCS\\robot_workspace\\RobotSeleniumConcept\\downloads\\IEDriverServer_Win32_3.150.1.zip

TC3_ChangeDownloadDir    
    ${prefs}    Create Dictionary    download.default_directory=${EXECDIR}${/}downloads    
    
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.selenium.dev/downloads/    browser=CHROME    options=add_experimental_option("prefs",${prefs})
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Click Element    link=32 bit Windows IE    
    Sleep    10s 
    File Should Exist    ${EXECDIR}${/}downloads\\IEDriverServer_Win32_3.150.1.zip


