*** Settings ***
Library           SeleniumLibrary
Variables       ../Variables/Locators/Browser_locators.py

*** Keywords ***
Start testcase for chrome
   Open browser        ${url2}  ${browser_chrome}
   Maximize Browser Window

Start testcase for firefox
   Open browser    ${url}    ${browser_firefox}
   sleep    10s
   Maximize Browser Window

Finish testcase
   Close Browser

Get Screen Height
    ${height}=    Execute Javascript    return window.innerHeight
    RETURN    ${height}

Scroll To Percentage
    [Arguments]    ${percentage}
    ${screen_height}=    Get Screen Height
    ${scroll_position}=    Evaluate    ${screen_height} * ${percentage} / 100
    Execute Javascript    window.scrollTo(0, ${scroll_position})