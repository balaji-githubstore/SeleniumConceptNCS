*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_VideoJS
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.youtube.com/watch?v=FX322RVNGj4    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Sleep    10s  
    Execute Javascript    document.querySelectorAll("[class='video-stream html5-main-video']")[0].play()
     
    ${currenttime}    Execute Javascript    return document.querySelectorAll("[class='video-stream html5-main-video']")[0].currentTime
    Log To Console    ${currenttime}    
    
    Execute Javascript    document.querySelectorAll("[class='video-stream html5-main-video']")[0].pause()
    Sleep    5s    
    Execute Javascript    document.querySelectorAll("[class='video-stream html5-main-video']")[0].play()
    
    ${duration}    Execute Javascript    return document.querySelectorAll("[class='video-stream html5-main-video']")[0].duration
    Log To Console    ${duration}
    

TC2_Tooltip
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://atozgrocery.in/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Click Element    xpath=//*[@class='fas fa-user-circle']
    Input Text    id=reg_email    king
    ${actualtoottip}    Execute Javascript    return document.querySelectorAll('[id="reg_email"]')[0].validationMessage   
    Log To Console    ${actualtoottip}    
    Should Contain    ${actualtoottip}    Please include an '@' in the email address 
    
   
    


