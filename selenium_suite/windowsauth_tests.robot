*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem    

*** Test Cases *** 
TC1_WindAuthUrl
    # http://Username:Password@SiteURL
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=http://jack:jack123@profit.novactech.in/PROFIT/Home/Home.aspx    browser=CHROME
    