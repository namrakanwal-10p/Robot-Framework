*** Settings ***
Library            SeleniumLibrary
Resource          ../../resources/CommonFunctionality.robot
Resource         ../../resources/WebsiteKeyword.robot


*** Test Cases ***
Select birth date from date picker
  [Documentation]  This case select the date from date_picker
  [Tags]  Functional

    Start testcase for chrome
    Click on widget
    Scroll To Percentage    50    # Scroll down by 50% of the screen height
    Click on date Picker
    Wait Until Element Is Visible    ${Select_Date_field}
    Select_Date_field
    Wait Until Element Is Visible    ${Select_month}
    Select month
    Scroll To Percentage    50    # Scroll down by another 50% of the screen height
    Click on month
    Wait Until Element Is Visible    ${Click_on_year}
    Click on year
    Wait Until Element Is Visible    ${Select_year}
    Select year
    Finish testcase
