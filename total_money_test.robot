*** Settings ***
Library    SeleniumLibrary
Library  Collections

*** Variables ***
${total_amount}=    5735
${banknotes}=    Create List   1000    500    100    50    20    10    5    2    1

*** Test Cases ***
Calculate Banknotes
    # ${total_amount}=  Set Variable  5735
    ${banknotes['1000']}=  Evaluate  int(${total_amount}//1000)
    ${total_amount}=  Evaluate  ${total_amount}%1000
    ${banknotes['500']}=  Evaluate  int(${total_amount}//500)
    ${total_amount}=  Evaluate  ${total_amount}%500
    ${banknotes['100']}=  Evaluate  int(${total_amount}//100)
    ${total_amount}=  Evaluate  ${total_amount}%100
    ${banknotes['50']}=  Evaluate  int(${total_amount}//50)
    ${total_amount}=  Evaluate  ${total_amount}%50
    ${banknotes['20']}=  Evaluate  int(${total_amount}//20)
    ${total_amount}=  Evaluate  ${total_amount}%20
    ${banknotes['10']}=  Evaluate  int(${total_amount}//10)
    ${total_amount}=  Evaluate  ${total_amount}%10
    ${banknotes['5']}=  Evaluate  int(${total_amount}//5)
    ${total_amount}=  Evaluate  ${total_amount}%5
    ${banknotes['2']}=  Evaluate  int(${total_amount}//2)
    ${total_amount}=  Evaluate  ${total_amount}%2
    ${banknotes['1']}=  Evaluate  int(${total_amount}//1)
    ${total_amount}=  Evaluate  ${total_amount}%1

    Log To Console    ${EMPTY}
    Log To Console    I get bank 1000 = ${banknotes['1000']}
    Log To Console    I get bank 500 = ${banknotes['500']}
    Log To Console    I get bank 100 = ${banknotes['100']}
    Log To Console    I get bank 50 = ${banknotes['50']}
    Log To Console    I get bank 20 = ${banknotes['20']}
    Log To Console    I get bank 10 = ${banknotes['10']}
    Log To Console    I get bank 5 = ${banknotes['5']}
    Log To Console    I get bank 2 = ${banknotes['2']}
    Log To Console    I get bank 1 = ${banknotes['1']}