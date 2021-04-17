*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem  
Library    String      

*** Test Cases ***
TC1_WebTable
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    #print the firstname
    ${name1}    Get Text    //table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}    
    
    ${name2}    Get Text    //table[@id='example']/tbody/tr[2]/td[2]
    Log To Console    ${name2}   
    

TC2_WebTable
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        Scroll Element Into View    //table[@id='example']/tbody/tr[${i}]/td[2]
        Press Keys    //table[@id='example']/tbody/tr[${i}]/td[2]    ARROW_DOWN
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        
        

    END
    
        
TC3_WebTable
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        
        Run Keyword If    '${name}'=='Brenden Wagner'    Click Element    //table[@id='example']/tbody/tr[${i}]/td[1]        
        Exit For Loop If    '${name}'=='Brenden Wagner'
    END


TC4_WebTable
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    ${total}    Set Variable    0
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1       
        ${sal}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[6]
        ${sal}    Remove String    ${sal}    $    ,
        ${sal}    Strip String    ${sal}
        
        # Log To Console    ${sal}
        ${total}    Evaluate    ${total}+${sal}    
        
    END

   Log To Console    ${total}  
   

TC5_WebTable
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Table Should Contain    //table[@id='example']    Bradley Greer
    
    #header row is not considering in the count 
    Table Row Should Contain    //table[@id='example']    1    Airi Satou
    #header row is considering in the count
    Table Cell Should Contain    //table[@id='example']    2    2    Airi Satou    
    Table Header Should Contain    //table[@id='example']    Name
    Table Footer Should Contain    //table[@id='example']     Position     
    Table Column Should Contain    //table[@id='example']    2    Ashton Cox       
    

TC6_WebTable         
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    5s
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    ${res}    Set Variable    'False'
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1 
     ${results}    Run Keyword And Ignore Error    Table Row Should Contain    //table[@id='example']    ${i}    Bruno Nash
     Log To Console    ${results}[0]    
     ${res}    Run Keyword If    '${results}[0]'=='PASS'    Set Variable     'True'        
     Exit For Loop If    '${results}[0]'=='PASS'
    END
    
    Log To Console    ${res}    
    Should Be Equal    ${res}    'True'    

TC6_WebTablePage       
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    5s
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    ${res}    Set Variable    'False'
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1 
       
        
        # Log To Console    ${sal}
     ${results}    Run Keyword And Ignore Error    Table Row Should Contain    //table[@id='example']    ${i}    Bruno Nash
     Log To Console    ${results}[0]    
     
     ${sal}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[6]
     Log To Console    ${sal}     

        
     ${res}    Run Keyword If    '${results}[0]'=='PASS'    Set Variable     'True'        
     Exit For Loop If    '${results}[0]'=='PASS'
     
    ${results}    Run Keyword And Ignore Error    Click Element    //*[text()='Next']    
    Log To Console    ${results}[0]
    Exit For Loop If    '${results}[0]'=='FAIL'
    END








