*** Settings ***
Library              SeleniumLibrary
Resource          ../../resources/CommonFunctionality.robot
Resource         ../../resources/orangeHRMkeyword.robot

*** Test Cases ***
Close the alert pop-up
  [Documentation]  This case click a alert button
  [Tags]  Functional

    Start testcase for chrome
    Alert widget
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${Alert_button}
    Alert button
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${Click_me}
    Click me button
    Handle alert    ACCEPT
    Finish testcase