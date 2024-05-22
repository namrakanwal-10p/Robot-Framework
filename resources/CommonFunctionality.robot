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
