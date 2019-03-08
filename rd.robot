*** Settings ***
Library   SeleniumLibrary

*** Test Case ***
เปิดและปิดหน้า popup การยื่นภาษี
    ไปยังหน้ายื่นแบบ online
    ทำการ download ไฟล์สำหรับการตั้งค่า browser
    ปิดหน้า popup

*** Keywords ***
ปิดหน้า popup
    Click Element   xpath://*[@id="lightboxdialog"]/button
    
ทำการ download ไฟล์สำหรับการตั้งค่า browser
    Select Frame   xpath://*[@id="lightboxdialog"]/p/iframe
    Click Link   คลิก
    Unselect Frame

ไปยังหน้ายื่นแบบ online
    Open browser  
    ...  https://rdserver.rd.go.th/publish/index.php
    ...  browser=chrome
    Click Link   ยื่นแบบออนไลน์
