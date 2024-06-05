*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome


*** Test Cases ***
Example Test
    Log To Console    ${EMPTY}
    Open Browser    https://www.advantageonlineshopping.com    Chrome     options=add_experimental_option("detach", True)
    Wait Until Page Contains Element    //*[@id="menuUser"]
    
    Click Element    //*[@id="menuUser"]
    Sleep    7

    Click Element    //input[@name="username"]
    Input Text    //input[@name="username"]    rossarin
    Click Element    //input[@name="password"]
    Input Text    //input[@name="password"]    Ploymai1908
    Click Element    //input[@name="remember_me"]   
    Click Element    //*[@id="sign_in_btn"]
    Sleep    5

    Click Element    //*[@id="miceImg"]
    Sleep    3
    Click Element    //*[@id=29]
    Sleep    5
    Click Element    //*[@id="productProperties"]/div[2]/e-sec-plus-minus/div/div[3]
    Sleep    3
    Click Element    //button[@name="save_to_cart"]
    Sleep    3
    Click Element    //*[@id="menuCart"]
    Sleep    3
    Click Button    //*[@id="checkOutButton"]
    Sleep    5
    Click Element    //*[@id="next_btn"]
    Sleep    5
    Input Text    //*[@id="paymentMethod"]/div/div[2]/sec-form/sec-view[1]/div/input    rossarin16
    Sleep    3
    Input Text    //*[@name="safepay_password"]    Ploymai1908
    Sleep    3
    Click Button    //*[@id="pay_now_btn_SAFEPAY"]
    Sleep    3
        ${text}    Get Text     //*[@id="orderPaymentSuccess"]/h2/span
        Should Be Equal    ${text}    Thank you for buying with Advantage
        Log To Console    ${text}
    Sleep    5
    Close Window