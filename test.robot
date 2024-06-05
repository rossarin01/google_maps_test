*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome


*** Test Cases ***
Example Test
    Log To Console    ${EMPTY}
    Open Browser    https://www.advantageonlineshopping.com    Chrome     options=add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    3
    Click Element    //[@id="menuUser"]
    Sleep    3
    Input Text    //[@name="username"]    Test02
    Input Text    //[@name="password"]    P@ssw0rd
    Click Element    //[@id="sign_in_btn"]
    Click Element      //*[@id="miceImg"]

    
    

    
