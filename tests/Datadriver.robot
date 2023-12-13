*** Settings ***
Library      SeleniumLibrary
Library      DataDriver          ../TestData/Data.csv
Test Template       invalid login
Test Teardown       close all browsers

*** Test Cases ***
LoginFormTest using ${username} and  ${password}

*** Keywords ***
Invalid login
  [Arguments]         ${username}   ${password}
  Open Browser        https://www.saucedemo.com/inventory.html   browser=Chrome
  Input text          id:user-name        ${username}
  Input text          id:password         ${password}
  Click element       id:login-button