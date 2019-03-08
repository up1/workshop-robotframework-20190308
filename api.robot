*** Settings ***
Library   RequestsLibrary

*** Test Case ***
Get all users with success
    Call API
    # Check result from API

*** Keywords ***
Call API
    Create Session   api   
    ...  https://jsonplaceholder.typicode.com
    ${response}=  Get Request  api  /users
    Should Be Equal
    ...  ${response.status_code}  ${200}
    Length Should Be
    ...  ${response.json()}  10
    Should Be Equal
    ...  ${response.json()[0]['id']}  ${1}
    Should Be Equal
    ...  ${response.json()[0]['name']}  
    ...  Leanne Graham

