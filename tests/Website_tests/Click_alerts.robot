*** Settings ***
Library              SeleniumLibrary
Resource          ../../resources/CommonFunctionality.robot
Resource         ../../resources/WebsiteKeyword.robot

*** Test Cases ***
Close the alert pop-up
  [Documentation]  This case click a alert button
  [Tags]  Functional

    Start testcase for chrome
    Alert widget
    Wait Until Element Is Visible    ${Alert_button}
    Alert button
    Wait Until Element Is Visible     ${click_me}
    Click me button
    Handle alert    ACCEPT
    Finish testcase