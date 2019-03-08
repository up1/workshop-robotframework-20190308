*** Settings ***
Library   SeleniumLibrary
Suite Setup     เข้า google
Suite Teardown  Close Browser
Test Teardown   ไปยังหน้าแรกของ google

*** Variables ***
${URL}  http://www.google.com

*** Test Cases ***
1) Search by ไม่รู้
    ค้นหาคำว่า  ไม่รู้

2) Search by รู้
    ค้นหาคำว่า  รู้

3) Search by bnk48
    [Tags]  testing  dev
    ค้นหาคำว่า  bnk48

*** Keywords ***
ไปยังหน้าแรกของ google
    Go To  ${URL}

ค้นหาคำว่า
    [Arguments]  ${keyword}
    Input Text  name:q  ${keyword}
    Press Keys  name:q   RETURN

เข้า google
    Open Browser  ${URL}
    ...  browser=chrome
    Maximize Browser Window



