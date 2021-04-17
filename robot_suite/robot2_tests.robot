*** Settings ***
Library    Collections    

*** Variables ***
${BROWSER}    chrome
@{COLORS}    red    green    yellow
&{DIC}    username=bala    password=pass123

*** Test Cases ***
TC1
    Log To Console    ${BROWSER}   
    Log To Console    ${COLORS}[0]     
    Log To Console    ${DIC}[username]    
    
TC2
    Log To Console    ${BROWSER} 
    Log To Console    ${COLORS}[1] 
    

TC3_PrintKeys
    ${keys}    Get Dictionary Keys    ${DIC}   
    Log To Console    ${keys}     
    
    FOR    ${key}    IN    @{keys}
        Log To Console   ${key} = ${DIC}[${key}]    
    END
    
    ${values}    Get Dictionary Values    ${DIC}    
    Log To Console    message    
    