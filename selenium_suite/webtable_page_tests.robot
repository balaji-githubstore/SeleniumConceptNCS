*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem  
Library    String    
 
*** Keywords ***
GetCellValue
    [Arguments]    ${cellvalue}
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[${cellvalue}]
        Log To Console    ${name}
    END
    Log To Console    -----------------------    
    
*** Test Cases ***
TC1_WebTable
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${count}    Get Element Count    //*[@id='example_paginate']/span/a
    Log To Console    ${count}   
    
    FOR    ${pagecount}    IN RANGE    1    ${count}
        GetCellValue    2
        Click Element    //*[text()='Next']  
        Run Keyword If    ${pagecount}==(${count}-1)    GetCellValue    2          
    END
    # GetCellValue    2
    
TC2_PageCount
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://editor.datatables.net/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${text}    Get Text    //*[contains(text(),'Showing 1')]
    Log To Console    ${text}  
    
    ${endindex}    Set Variable     ${text.index(" of")}  
    ${value1}    Get Substring    ${text}    13    ${endindex}
    
    Log To Console    ${value1}     
    

    ${endindex}    Set Variable     ${text.index(" entries")}  
    ${value2}    Get Substring    ${text}    19    ${endindex}
    
    Log To Console    ${value2} 
    
    ${pagecount}    Evaluate    ${value2}/${value1} 
    ${pagecount}    Convert To Integer    ${pagecount}       
    Log To Console    ${pagecount}  
    
    FOR    ${i}    IN RANGE    1    ${pagecount}+1
        Log To Console    ${i}    
        GetCellValue    2
        Click Element    //*[text()='Next']  
        Run Keyword If    ${i}==(${pagecount})    GetCellValue    2          
    END  
    
    
TC1
     FOR    ${i}    IN RANGE    0    10    2    
        Log To Console    ${i}              
    END