*** Settings ***
Library      SeleniumLibrary
Library      DataDriver  ../TestData/Data.csv
Resource         ../resources/WebsiteKeyword.robot
Resource     ../resources/CommonFunctionality.robot

Test Template       login
Test Teardown       close all browsers

*** Keywords ***
login
  [Arguments]     ${username}   ${password}
  Start testcase for firefox
  Input text          ${username_orangeHRM}       ${username}
  Input text          ${password_orangeHRM}       ${password}
  Click element       ${sign_in_orangeHRM}

*** Test Cases ***

LoginFormTest using     ${username}    ${password}