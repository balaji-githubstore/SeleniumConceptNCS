*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_GetDetail
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    20s
    ${linkcount}     Get Element Count    xpath=//a
    Log To Console    ${linkcount} 
    
   ${href}    Get Element Attribute    xpath=//a[text()='Gmail']    href
   Log To Console    ${href}    
      
   ${text}    Get Text    xpath=//a[text()='Gmail']
   Log To Console    ${text}    
    
TC2_GetWebElementDetail
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    20s
    ${ele}    Get WebElement    xpath=//a
    Log To Console    ${ele}  
    
    ${href}    Get Element Attribute    ${ele}    href
    Log To Console    ${href}
  
    
    # Click Element    ${ele}    
    
TC3_GetWebElementDetail
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    20s
    
    ${count}     Get Element Count    xpath=//a
    Log To Console    ${count}     

    ${elements}    Get WebElements    //a
    Log To Console    ${elements}    

    # ${href}    Get Element Attribute    ${elements}[24]    href
    # Log To Console    ${href}

    FOR    ${i}    IN RANGE    0    ${count} 
        
        ${href}    Get Element Attribute    ${elements}[${i}]    href
        Log To Console    ${href}
        
         ${text}    Get Text     ${elements}[${i}]
         Log To Console    ${text} 
         
        Run Keyword If    '${text}'=='Images'    Click Element    ${elements}[${i}]         
        Exit For Loop If    '${text}'=='Images'
           
    END

TC4_GetWebElementDetail
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://google.com    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    20s

    ${elements}    Get WebElements    //a
    # Log To Console    ${elements} 
    
    # Log To Console    ${elements}[0]     
    
    FOR    ${element}    IN    @{elements}
        ${href}    Get Element Attribute    ${element}    href
        Log To Console    ${href}    
        
        ${text}    Get Text    ${element}
        Log To Console    ${text}
        
        Run Keyword If    '${text}'=='Images'    Click Element    ${element}          
        Exit For Loop If    '${text}'=='Images'
    END




    
