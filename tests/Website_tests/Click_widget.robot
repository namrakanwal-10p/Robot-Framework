*** Settings ***
Library            SeleniumLibrary
Resource          ../../resources/CommonFunctionality.robot
Resource         ../../resources/orangeHRMkeyword.robot


*** Test Cases ***
Select birth date from date picker
  [Documentation]  This case select the date from date_picker
  [Tags]  Functional

    Start testcase for chrome
    Click on widget
    execute javascript    window.scrollTo(0,500)
    Click on date Picker
    Wait Until Keyword Succeeds    20s    30s    Element Should Be Visible    ${Select_Date_field}
    Select_Date_field
    Wait Until Keyword Succeeds    20s    30s    Element Should Be Visible    ${Select_month}
    Select month
    execute javascript    window.scrollTo(0,500)
    Click on month
    Wait Until Keyword Succeeds    20s    20s    Element Should Be Visible    ${Click_on_year}
    Click on year
    Wait Until Keyword Succeeds    20s    20s    Element Should Be Visible    ${Select_year}
    Select year
    Click on date
    Finish testcase

