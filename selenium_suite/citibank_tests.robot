*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_WindowBrowserClose
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.online.citibank.co.in/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Click Element    link=APPLY FOR CREDIT CARDS    
    Sleep    5s 
    ${title}    Get Title  
    Log To Console    ${title}          
    # Close Window
    Close Browser

TC2_MultipleTab1
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.online.citibank.co.in/    browser=chrome
    Maximize Browser Window 
    Set Selenium Implicit Wait    50s
    Click Element    link=APPLY FOR CREDIT CARDS    
    Sleep    5s 
    Switch Window    Online Credit Card Application Form | Citi India
    Click Element    link=Travel 
    Sleep    2s 
    Close Window
    
TC3_MultipleTab1
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.online.citibank.co.in/    browser=ff    options=binary_location=C:\\Program Files\\Mozilla Firefox
    Maximize Browser Window 
    Set Selenium Implicit Wait    50s
    Click Element    xpath=//*[text()='Login']    
    Sleep    5s 
    Switch Window    Citibank India
    Input Text    id=User_Id    balajidinakaran    
    Sleep    2s 
    Close Window
    
    Switch Window    Citi India - Credit Cards, Personal & Home Loans, Investment, Wealth Management & Banking
    #get title and print
    ${title}    Get Title  
    Log To Console    ${title}
    

TC4_MultipleTab1
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.online.citibank.co.in/    browser=chrome
    Maximize Browser Window 
    Set Selenium Implicit Wait    50s
    Click Element    xpath=//*[text()='Login']    
    Sleep    5s 
    Switch Window    NEW
    Input Text    id=User_Id    balajidinakaran  
    Switch Window    MAIN  
    ${title}    Get Title  
    Log To Console    ${title}



   