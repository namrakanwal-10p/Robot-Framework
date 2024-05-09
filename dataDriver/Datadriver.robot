*** Settings ***
Library      SeleniumLibrary
Library      DataDriver  ../TestData/Data.csv
Resource     ../resources/orangeHRMkeyword.robot
Resource     ../resources/CommonFunctionality.robot


Test Template       login
Test Teardown       close all browsers


*** Keywords ***

login
  [Arguments]     ${username}   ${password}
  Start testcase for firefox
  Input text          xpath://input[@placeholder='Username']        ${username}
  Input text          xpath://input[@placeholder='Password']        ${password}
  Click element       xpath://button[@type='submit']

*** Test Cases ***

LoginFormTest using     ${username}    ${password}