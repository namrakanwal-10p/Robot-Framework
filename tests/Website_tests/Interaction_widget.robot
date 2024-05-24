*** Settings ***
Library              SeleniumLibrary
Resource          ../../resources/CommonFunctionality.robot
Resource         ../../resources/WebsiteKeyword.robot
Variables        ../../variables/Locators/Website_locators.py

*** Test Cases ***
Interaction of Sorting
  [Documentation]  This case should verify the list is sorted
  [Tags]  Functional

  Start testcase for chrome
  Scroll To Percentage    50
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

Grid Test Element Presence
  [Documentation]  This case drag the fifth element with nine
  [Tags]  Functional

  Start testcase for chrome
  Scroll To Percentage    50
  Click on interaction
  Scroll To Percentage    50
  click_on_sortable
  click_on_grid
  Get selenium implicit wait
  Scroll To Percentage    50
  Wait until element is visible    ${fifth_element}
  ${source_element}    Get WebElement    ${fifth_element}
  ${target_element}    Get WebElement    ${nineth_element}
  Drag and drop     ${source_element}     ${target_element}
  Finish testcase