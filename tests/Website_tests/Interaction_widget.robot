*** Settings ***
Library              SeleniumLibrary
Resource          ../../resources/CommonFunctionality.robot
Resource         ../../resources/orangeHRMkeyword.robot
Variables        ../Variables/Locators/website_locators.py

*** Test Cases ***
Interaction of Sorting
  [Documentation]  This case should verify the list is sorted
  [Tags]  Functional

  Start testcase for chrome
  Click on interaction
  execute javascript    window.scrollTo(0,400)
  click_on_sortable
  Wait Until Keyword Succeeds    20s    10s    Element Should Be Visible    ${alphabet_list}
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
  Click on interaction
  execute javascript    window.scrollTo(0,500)
  click_on_sortable
  click_on_grid
  Get selenium implicit wait
  execute javascript    window.scrollTo(0,500)
  ${source_element}    Get WebElement    ${fifth_element}
  ${target_element}    Get WebElement    ${nineth_element}
  Drag and drop     ${source_element}     ${target_element}
  Finish testcase