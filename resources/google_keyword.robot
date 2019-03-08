*** Variables ***
${URL}  http://www.google.com

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