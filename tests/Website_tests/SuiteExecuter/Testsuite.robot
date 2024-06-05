*** Settings ***
Suite Setup    Open My Browser
Suite Teardown    Close Browser
Test Setup    Reset Browser State
Resource    ../../../resources/WebsiteKeyword.robot
Resource    ../../../resources/CommonFunctionality.robot

*** Variables ***
${BROWSER}    firefox
${URL}    https://demoqa.com/
${DELAY}    2s   # Define the delay duration

*** Keywords ***
Open My Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Reset Browser State
    Go To    ${URL}
    Remove Overlapping Elements
    Set Selenium Timeout    10s

Close Browser
    Close All Browsers

Remove Overlapping Elements
    Execute JavaScript    document.querySelectorAll('img[alt="adplus-dvertising"]').forEach(el => el.remove());
    Execute JavaScript    document.querySelectorAll('iframe').forEach(el => el.remove());
    Execute JavaScript    document.querySelectorAll('footer').forEach(el => el.style.display = 'none');
    Execute JavaScript    document.querySelectorAll('div[role="dialog"]').forEach(el => el.style.display = 'none');

Scroll To Percentage
    [Arguments]    ${percentage}
    ${window_height}=    Execute JavaScript    return window.innerHeight
    ${scroll_amount}=    Evaluate    ${window_height} * ${percentage} / 100
    Execute JavaScript    window.scrollBy(0, ${scroll_amount})

*** Test Cases ***
Click Alerts Tests
    [Documentation]    Test clicking alert buttons

    Sleep     10s
    Alert widget
    Wait Until Element Is Visible    ${Alert_button}
    Sleep    ${DELAY}
    Alert button
    Wait Until Element Is Visible    ${click_me}
    Sleep    ${DELAY}
    Click me button
    Handle alert    ACCEPT

Click Widget Tests
    [Documentation]    Test clicking widget elements

    Wait Until Element Is Visible    ${Widgets}
    Sleep    ${DELAY}
    Click on widget
    Scroll To Percentage    50    # Scroll down by 50% of the screen height
    Wait Until Element Is Visible    ${Click_on_date_picker}
    Sleep    ${DELAY}
    Click on date Picker
    Wait Until Element Is Visible    ${Select_Date_field}
    Sleep    ${DELAY}
    Click Element    ${Select_Date_field}
    Wait Until Element Is Visible    ${Select_month}
    Sleep    ${DELAY}
    Click Element    ${Select_month}
    Scroll To Percentage    50    # Scroll down by another 50% of the screen height
    Wait Until Element Is Visible    ${Click_on_year}
    Sleep    ${DELAY}
    Click Element    ${Click_on_year}
    Wait Until Element Is Visible    ${Select_year}
    Sleep    ${DELAY}
    Click Element    ${Select_year}

Interaction Widget Tests
    [Documentation]    Test interaction widgets

    Wait Until Element Is Visible    ${interaction_widget}
    Scroll To Percentage    20
    Sleep    ${DELAY}
    Click on interaction
    Scroll To Percentage    20
    Wait Until Element Is Visible    ${click_on_sortable}
    Sleep    ${DELAY}
    Click on sortable
    Wait Until Element Is Visible    ${alphabet_list}
    ${alphabet_locator}=    Get WebElement   ${alphabet_list}
    @{element_texts}=    Create List
     FOR    ${alphabet_locator}     IN    ${alphabet_locator}
    ${text}=    Get Text    ${alphabet_locator}
    ${text}=    Evaluate    $text.replace('\\n', '')   # Remove newline characters
    ${element_texts}=    Evaluate    ${element_texts} + [$text]
    Log to console    ${alphabet_locator.text}
  END
    ${sorted_texts}=    Evaluate    sorted(${element_texts})
    Log To Console    Sorted List: ${sorted_texts}
    Should Be Equal    ${element_texts}    ${sorted_texts}
    Finish testcase
