*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem    

*** Test Cases ***
TC1_SignUp
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.royalcaribbean.com/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    Run Keyword And Ignore Error    Click Element    xpath=//*[@class='email-capture__close']  
    
    # ${count}     Get Element Count    xpath=//*[@class='email-capture__close']
    # Log To Console    ${count}  
    # Run Keyword If    ${count}>0    Click Element    xpath=//*[@class='email-capture__close']    

    Click Element    id=rciHeaderSignIn     
    Click Element    link=Create an account    
    Input Text    xpath=//*[@data-placeholder='First name/Given name']    Balaji    
    Input Text    xpath=//*[@data-placeholder='Last name/Surname']    Dinakaran    
    
    Click Element    xpath=//*[text()='Month']    
    Sleep    1s      
    Click Element    xpath=//*[contains(text(),'December')]    
    
    # //*[text()=' 24 ']
    Click Element    xpath=//*[contains(text(),'Day')]    
    Sleep    1s    
    Click Element    xpath=//span[contains(text(),'4')]
      
    Input Text    xpath=//*[@data-placeholder='Year']    1984    

    Click Element    xpath=//*[contains(text(),'Country')]     
    # //*[text()=' India ']
    Click Element    xpath=(//*[contains(text(),'India')])[2]     
    
    