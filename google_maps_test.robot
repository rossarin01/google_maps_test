*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ExcelRobot


*** Variables ***
${BROWSER}    Chrome
${Excel}    D:\\maps_test.xlsx


*** Test Cases ***
Google maps test
    Set Library Search Order    ExcelRobot
    Open Excel   ${Excel}
    Log To Console    ${EMPTY}
    Open Browser    https://www.google.co.th/maps    Chrome    option=ad_experimental_option("detach", True)
    Sleep    3


    # North Region
    # กรุงเทพ-แพร่
    Click Element    //*[@jslog="11886"]
    Input Text    //*[@jslog="11886"]    กรุงเทพ
    Press Key    //*[@jslog="11886"]    \ue007
    Sleep    3 
    Click Element    //*[@id="QA0Szd"]/div/div/div[1]/div[2]/div/div[1]/div/div/div[4]/div[1]/button
    Sleep    3
    Input Text    //*[@id="sb_ifc50"]/input    กรุงเทพ
    Sleep    3
    Input Text    //*[@id="sb_ifc51"]/input    แพร่
    Press Key    //*[@id="sb_ifc51"]/input    \ue007
    Click Element    //*[@id="omnibox-directions"]/div/div[2]/div/div/div/div[2]/button
    Sleep    3
    Wait Until Page Contains Element    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[1]
    ${BkktoPratime}    Get Text    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[1]
    Wait Until Page Contains Element    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[2]/div
    ${BkktoPrakm}    Get Text    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[2]/div
    Sleep    5


    # Northeast Region
    # กรุงเทพ-อุบลราชธานี
    Double Click Element    //*[@id="sb_ifc50"]/input
    Input Text    //*[@id="sb_ifc50"]/input    กรุงเทพ
    Press Key    //*[@id="sb_ifc50"]/input    \ue007
    Sleep    3
    Double Click Element    //*[@id="sb_ifc51"]/input
    Input Text    //*[@id="sb_ifc51"]/input    อุบลราชธานี
    Press Key    //*[@id="sb_ifc51"]/input    \ue007
    Click Element    //*[@id="omnibox-directions"]/div/div[2]/div/div/div/div[2]/button
    Sleep    3
    Wait Until Page Contains Element    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[1]
    ${BkktoUbntime}    Get Text    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[1]
    Wait Until Page Contains Element    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[2]/div
    ${BkktoUbnkm}    Get Text    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[2]/div
    Sleep    5


    # Southern Region
    # กรุงเทพ-สุราษฎร์ธานี
    Double Click Element    //*[@id="sb_ifc50"]/input
    Input Text    //*[@id="sb_ifc50"]/input    กรุงเทพ
    Press Key    //*[@id="sb_ifc50"]/input    \ue007
    Sleep    3
    Double Click Element    //*[@id="sb_ifc51"]/input
    Input Text    //*[@id="sb_ifc51"]/input    สุราษฎร์ธานี
    Press Key    //*[@id="sb_ifc51"]/input    \ue007
    Click Element    //*[@id="omnibox-directions"]/div/div[2]/div/div/div/div[2]/button
    Sleep    3
    ${BkktoSrntime}    Get Text    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[1]
    Wait Until Page Contains Element    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[1]
    ${BkktoSrnkm}    Get Text    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[2]/div
    Wait Until Page Contains Element    //*[@id="section-directions-trip-0"]/div[1]/div/div[1]/div[2]/div
    Sleep    5


    
    ${list_time}    Create List    ${BkktoPratime}    ${BkktoUbntime}    ${BkktoSrntime}
    ${list_km}    Create List    ${BkktoPrakm}        ${BkktoUbnkm}    ${BkktoSrnkm}

    ${list1}    Create List    แพร่    อุบลราชธานี    สุราษฎร์ธานี
    ${count}    Get Length    ${list_time}
    Sleep    3
    Close Browser


    Open Excel To Write    ${Excel}    new_path=D:\\maps_test01.xlsx    override=override
    FOR    ${output}    IN RANGE    0    ${count}
            Log To Console    ${count}
            ${i}    Evaluate    ${count} + 2
            Write To Cell By Name    output    A${i}    PASS    data_type=TEXT
            Write To Cell By Name    output    B${i}    PASS    data_type=TEXT
            Write To Cell By Name    output    C${i}    กรุงเทพ    data_type=TEXT
            Write To Cell By Name    output    D${i}    ${list1}[${output}]    data_type=TEXT
            Write To Cell By Name    output    E${i}    ${list_km}[${output}]    data_type=TEXT
            Write To Cell By Name    output    F${i}    ${list_time}[${output}]    data_type=TEXT    
    END
    Save Excel