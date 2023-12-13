*** Settings ***
Library           SeleniumLibrary
Variables       ../Variables/Locators/Swag_labs_locators.py

*** Keywords ***
Start testcase
   Open browser        ${url}  ${browser}   {CHROMEDRIVER_PATH}= C:/Users/namra.kanwal/Downloads/chromedriver_win32 (2)/chromedriver.exe
   Maximize Browser Window

Finish testcase
   Close Browser
