*** Settings ***
Force Tags    ftag

Default Tags    dtag

*** Test Cases ***
#tag name ftag and tc1tag
TC1
    [Tags]    OP-101 
    Log To Console    tc1 
    Log To Console    ${TEST_TAGS}
       
    FOR    ${tag}    IN    @{TEST_TAGS}
        Log To Console    ${tag}    
    END 
      
#tag name ftag and dtag
TC2
    Log To Console    tc2 
    Set Tags    TC2    invalid    fff
    Remove Tags    ftag    dtag
    Log To Console    ${TEST_TAGS}

#tag name ftag and dtag 
TC3
    Log To Console    tc3    
    Remove Tags    ftag   
    