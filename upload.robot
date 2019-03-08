*** Settings ***
Library   SeleniumLibrary
# Test Teardown  Close Browser

*** Test Case ***
Upload success with 3 files
    Open upload page
    Choose image image01.png
    Choose image image02.png
    Choose image image03.png
    Check choosed files to upload
    Upload all files

*** Keywords ***
# round((100/3) * no)
Upload file
    [Arguments]  ${no}
    SeleniumLibrary.Click Element   xpath://table/tbody/tr[${no}]/td[5]/button[1]
    ${result}=  BuiltIn.Evaluate  100.0/3*${no}
    ${result}=  BuiltIn.Convert To Number  ${result}  0
    ${result}=  BuiltIn.Convert To Integer  ${result}
    BuiltIn.Log To Console   \n>>>>>>>${result}\n
    SeleniumLibrary.Wait Until Page Contains Element  
    ...  xpath://div[@style="width: ${result}%;"]
    
Upload all files
    Upload file  1
    Upload file  2
    Upload file  3

Choose image ${filename}
    Choose File   xpath://div[2]/div[1]/input[2]
    ...  ${CURDIR}/${filename}

Check choosed files to upload
    Page Should Contain Element  xpath://table/tbody/tr
    ...  limit=3
    

Open upload page
    Open Browser  http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...  browser=chrome
    Maximize Browser Window