*** Settings ***
Library    SeleniumLibrary       
Library    OperatingSystem 
   
*** Test Cases ***
TC1_FlightBooking
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://phptravels.net/en    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Set Selenium Speed    1s
    Click Element    xpath=//span[text()='Economy'] 
    Click Element    xpath=//li[text()='Business']    
    #round trip
    # Select Radio Button    triptype    round
    Click Element    xpath=//*[text()='Round Trip']
    #New york (EWR)
    #option 1
    Click Element    xpath=//*[text()='LHE']    
    Input Text    xpath=//*[@id='select2-drop']//input    New York
    Click Element    xpath=//*[contains(text(),'JFK')]    
    
    
    #London(BQH)
    #option2
    # Click Element    xpath=//*[text()='DXB']    
    # Press Keys    None    London
    # Click Element    xpath=//*[contains(text(),'BQH')]  
    
    #option3
    Click Element    xpath=//*[text()='DXB']    
    Press Keys    None    London
    Press Keys    None    RETURN
    
    # Input Text    id=FlightsDateStart    2021-04-23    
    
    #complete js
    # Execute Javascript    document.getElementById('FlightsDateStart').value='2021-04-23'

    ${departelement}    Get WebElement    xpath=//input[@placeholder='Depart']
    Execute Javascript    arguments[0].value='2021-04-23'    ARGUMENTS    ${departelement}     
    
    Execute Javascript    document.getElementById('FlightsDateEnd').value='2021-04-29'
    
    ${val}    Execute Javascript    return document.getElementById('FlightsDateEnd').value
    Log To Console    ${val}      
    
     ${val}    Execute Javascript    return document.getElementById('FlightsDateEnd').placeholder
    Log To Console    ${val}    
    
    ${val}    Execute Javascript    return document.title
    Log To Console    ${val}  

    ${departelement}    Get WebElement    xpath=//input[@placeholder='Depart']
    ${val}    Execute Javascript    return arguments[0].value   ARGUMENTS    ${departelement} 
    Log To Console    ${val}  

    ${adultcount}    Set Variable    3

    FOR    ${i}    IN RANGE    1    ${adultcount} 
        Click Element    xpath=//*[@name='fadults']/following::button 
    END
       
    ${childcount}    Set Variable    2

    FOR    ${i}    IN RANGE    0    ${childcount} 
        Click Element    xpath=//*[@name='fchildren']/following::button 
    END

    Click Element    xpath=//button[contains(text(),'Search')]    

    Page Should Contain    JFK 
    Page Should Contain    BQH        








