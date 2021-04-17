*** Settings ***
Library    DateTime    
Library    String    
*** Test Cases ***
TC1_Basic
    Log To Console    balaji dinakaran    
    Log To Console    robotsession    
 
TC2_Basic
    Log To Console    Tuesday               
    
TC3_Basic
    ${currentdate}    Get Current Date  
    Log To Console    ${currentdate}  
    Log    ${currentdate}      
    ${name}    Set Variable    Balaji 
    Log    ${name}   

TC4_Basic
    Log To Console    ${CURDIR}    
    Log To Console    ${EXECDIR}    
    Log To Console    ${OUTPUT_DIR}    
    Log To Console    ${TEMPDIR}    
    Log To Console    ${SUITE_NAME}    
    Log To Console    ${TEST_NAME}    
    
TC5_ForLoop
    #1 to 5
    FOR    ${i}    IN RANGE   1     11   
        Log To Console    ${i}    
    END
    

TC6_Add
    ${val1}    Set Variable    $132,000
    ${val2}    Set Variable    $12,000
    
   ${val1}    Remove String    ${val1}    $    ,
   ${val2}    Remove String    ${val2}    $    ,
    
   Log To Console    ${val1} 
   Log To Console    ${val2}    
   
   # ${val1}    Convert To Integer    ${val1}    
    
   ${res}    Evaluate      ${val1}+${val2}
   Log To Console    ${res}   
    



    