*** Settings ***
Suite Setup    Open My Browser
Suite Teardown    Close Browser
Test Setup    Reset Browser State
Test Teardown    Add Delay
Resource    ../../../resources/WebsiteKeyword.robot
Resource    ../../../resources/CommonFunctionality.robot

*** Variables ***
${BROWSER}    chrome
${URL}    https://demoqa.com/
${DELAY}    2s   # Define the delay duration

*** Keywords ***
Open My Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    sleep     10s

Reset Browser State
    Go To    ${URL}
    Remove Overlapping Elements

Close Browser
    Close All Browsers

Add Delay
    Sleep    ${DELAY}   # Adding delay between test cases

Remove Overlapping Elements
    Execute JavaScript    document.querySelectorAll('img[alt="adplus-dvertising"]').forEach(el => el.remove());

*** Test Cases ***
Click Alerts Tests
    [Documentation]    Test clicking alert buttons
    Sleep    7s
    Alert widget
    Wait Until Element Is Visible    ${Alert_button}
    Alert button
    Wait Until Element Is Visible    ${click_me}
    Click me button
    Handle alert    ACCEPT

Click Widget Tests
    [Documentation]    Test clicking widget elements

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

Interaction Widget Tests
    [Documentation]    Test interaction widgets
  
    Click on interaction
    Scroll To Percentage    20
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
    Finish testcase

