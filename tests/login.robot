*** Settings ***
Library              SeleniumLibrary
Resource          ../resources/CommonFunctionality.robot
Resource          ../resources/swag_UserDefinedKeyword.robot


*** Test Cases ***
Verify login page
  [Documentation]  This case verified the login of application
  [Tags]  Functional

    Start testcase
    swag_UserDefinedKeyword.Enter email
    swag_UserDefinedKeyword.Enter Password
    swag_UserDefinedKeyword.Click SignIn
