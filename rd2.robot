*** Settings ***
Library   SeleniumLibrary

*** Test Case ***
Invalid ID number with Empty
    ไปยังหน้าลืมรหัสผ่าน
    กรอก ID เป็นค่าว่าง
    ต้องแสดง error code EO11

*** Keywords ***
ต้องแสดง error code EO11
    Alert Should Be Present   
    ...  ข้อความปฏิเสธ [E011] :${SPACE*2}กรุณาบันทึกทึกเลขประจำตัวผู้เสียภาษีอากร
    
    ${message}=  Handle Alert    
    Log To Console  ${message}
    Should Be Equal  ${message}  
    ...  ข้อความปฏิเสธ [E011] :${SPACE*2}กรุณาบันทึกทึกเลขประจำตัวผู้เสียภาษีอากร

กรอก ID เป็นค่าว่าง
    Input Text   id:nid   ${EMPTY}
    Click Element   id:bNext

ไปยังหน้าลืมรหัสผ่าน
    Open Browser   https://epit.rd.go.th/EFILING/RegController#
    ...  browser=chrome
    Click Link   สัญชาติไทย