*** Settings ***
Library    Collections    

Test Setup    NONE
*** Test Cases ***
TC1 
    [Setup]    Log To Console    ss    
    Set Global Variable    ${NAME}    balajidinkaran
    [Teardown]    
# TC2
    # Log To Console    ${NAME}     
    

      