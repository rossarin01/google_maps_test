*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Example Test
    Log To Console    ${EMPTY}
    Open Browser   https://www.google.com/    chrome    option=ad_experimental_option("detach", True)
    Maximize Browser Window   
    Wait Until Page Contains Element  //*[@class="gLFyf"]
    Sleep    3

    Input Text    //*[@class="gLFyf"]    robot framework
    Sleep    3
    Press Key    //*[@class="gLFyf"]       \ue007   
    Sleep    3
    # Your test steps here