*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
Test Case Mobile
    Open Application    http://localhost:4723/wd/hub	
    ...	platformName=Android	
    ...	platformVersion=11.0	
    ...	deviceName=Pixel 4 API 30	
    ...	appPackage=com.android.chrome	
    ...	appActivity=com.google.android.apps.chrome.Main
    
    Wait Until Element Is Visible    //*[@text="Accept & continue"]    10
    Click Element    //*[@text="Accept & continue"]
    Wait Until Element Is Visible    //*[@text="No thanks"]    10
    Click Element    //*[@text="No thanks"]
    Wait Until Element Is Visible    //*[@text="Search or type web address"]
    Input Text    //*[@text="Search or type web address"]    robotframework
    Press Keycode    66

    Wait Until Element Is Visible    //*[@text="https://robotframework.org"]    10
    Click Element    //*[@text="https://robotframework.org"]
    Sleep    3

    FOR    ${counter}    IN RANGE    200

        ${present}    Run Keyword And Ignore Error    Wait Until Element Is Visible    //*[@text="* Release date due to change"]    10
        Log To Console    present: ${present}
        Exit For Loop If       ${present}[0]"=="PASS"
        Press Keycode    93

        Log To Console    ${counter}
        
    END