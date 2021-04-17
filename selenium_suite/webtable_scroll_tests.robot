*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem

*** Test Cases ***
TC1_TableScroll
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1      
        Scroll Element Into View    //table[@id='example']/tbody/tr[${i}]/td[2]
        Sleep    0.5s    
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
        Log To Console    ${name}
    END
    
TC2_TableScrollARROWDOWN
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1      
        
        Press Keys    //table[@id='example']/tbody/tr[${i}]/td[2]    ARROW_DOWN        

        Sleep    0.5s    
        
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
        Log To Console    ${name}
    END
    
TC3_TableScrollJS
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1      
       Execute Javascript    document.querySelector('[class="dataTables_scrollBody"]').scrollBy(0,50)
        Sleep    0.5s    
        
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
        Log To Console    ${name}
    END

#scroll page and check for element
TC4_CheckElementWindowScroll
    Log To Console    scroll page and check for element    
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    5s
    
    FOR    ${i}    IN RANGE    1    20      
      Execute Javascript    window.scrollBy(0,500)
      
      ${list}    Run Keyword And Ignore Error    Click Element    //a[text()='Download']        
      Log To Console    ${list}[0]
      
      Exit For Loop If    '${list}[0]'=='PASS'    
       
    END
    Log To Console    ${i}    
    
    
TC5_TableHScroll
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_x.html   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1      
        Scroll Element Into View    //table[@id='example']/tbody/tr[${i}]/td[9]
   
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[9]
        Log To Console    ${name}
    END
   
TC5_TableHJS
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_x.html   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    Execute Javascript    document.querySelector('[class="dataTables_scrollBody"]').scrollBy(500,0)
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1      
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[9]
        Log To Console    ${name}
    END
     
TC6_ScrollElementIntoViewJS
    Execute Javascript    document.querySelector('[id="email"]').scrollIntoView()
    
TC7_Tooltip
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.demoqa.com/tool-tips/   browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    Sleep    2s    
    Mouse Over    id=toolTipButton
    Sleep    1s    
    # ${text}    Execute Javascript    return document.querySelector('[aria-describedby="buttonToolTip"]').innerHTML
    # Log To Console    ${text}    
    ${text}    Get Text    //*[@role='tooltip']
    Log To Console    ${text}    
    Sleep    1s
    Mouse Over    link=Contrary
    Sleep    1s    
    # ${text}    Execute Javascript    return document.querySelector('[aria-describedby="buttonToolTip"]').innerHTML
    # Log To Console    ${text}    
    ${text}    Get Text    //*[@role='tooltip']
    Log To Console    ${text}  


