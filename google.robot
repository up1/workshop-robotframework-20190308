*** Settings ***
Library   SeleniumLibrary
Resource  resources/google_keyword.robot
Suite Setup     เข้า google
Suite Teardown  Close Browser
Test Teardown   ไปยังหน้าแรกของ google

*** Test Cases ***
Search by keyword and found result
    [Template]  Search by keyword template
    #--------|------------------|
    #  Input |  Expected result |
    #----------------------------
        ไม่รู้        ไม่รู้
        รู้          รู้
        bnk48       BNK

*** Keywords ***
Search by keyword template
    [Arguments]  ${input}  ${expected_result}
    ค้นหาคำว่า  ${input}
    Wait Until Page Contains   ${expected_result}

