*** Settings ***
Suite Setup    Open My Browser
Suite Teardown    Close Browser
Test Setup    Reset Browser State
Resource         ../../../resources/WebsiteKeyword.robot

*** Variables ***
${BROWSER}    chrome
${URL}    https://demoqa.com/

*** Keywords ***
Open My Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Reset Browser State
    Go To    ${URL}

Close Browser
    Close All Browsers

*** Test Cases ***

Click Alerts Tests
    Alert widget
    Wait Until Element Is Visible    ${Alert_button}
    Alert button
    Wait Until Element Is Visible     ${click_me}
    Click me button
    Handle alert    ACCEPT

Click Widget Tests
    Click on widget
    execute javascript    window.scrollTo(0,500)
    Click on date Picker
    Wait Until Element Is Visible    ${Select_Date_field}
    Select_Date_field
    Wait Until Element Is Visible    ${Select_month}
    Select month
    execute javascript    window.scrollTo(0,500)
    Click on month
    Wait Until Element Is Visible    ${Click_on_year}
    Click on year
    Wait Until Element Is Visible    ${Select_year}
    Select year

Interaction Widget Tests
  execute javascript    window.scrollTo(0,200)
  Click on interaction
  execute javascript    window.scrollTo(0,200)
  Wait until element is visible    ${click_on_sortable}
  click_on_sortable
  Wait Until Element Is Visible    ${alphabet_list}
  ${alphabet_locator}    Get WebElement   ${alphabet_list}
  @{element_texts}=    Create List
  FOR    ${alphabet_locator}     IN    ${alphabet_locator}
  ${text}=    Get Text    ${alphabet_locator}
  ${text}=    Evaluate    $text.replace('\\n', '')   # Remove newline characters
  ${element_texts}=    Evaluate    ${element_texts} + [$text]
   Log to console    ${alphabet_locator.text}
  END
    ${sorted_texts}=    Evaluate    sorted($element_texts)
    Log to console    Sorted List: ${sorted_texts}
    Should be equal    ${element_texts}    ${sorted_texts}
