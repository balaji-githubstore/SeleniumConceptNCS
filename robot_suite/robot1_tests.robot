*** Settings ***
Library    Collections    

*** Test Cases ***
TC1_Variable 
     ${name}    Set Variable    bala
     Log To Console    ${name}    
     
     @{colors}    Create List    red    green    yellow
     Log To Console    ${colors}[1]    
     
    Append To List    ${colors}    purple
    
    #get count of list
    ${count}    Get Length    ${colors}
    Log To Console    ${count}   

    FOR    ${i}    IN RANGE    0    ${count}
       Log To Console    ${colors}[${i}]
    END
    
    FOR    ${color}    IN    @{colors}
        Log To Console    ${color}
    END
    


TC2_Dic
    &{dic}    Create Dictionary    username=bala    password=123456
    Log To Console    ${dic}[username]   
  
    

      