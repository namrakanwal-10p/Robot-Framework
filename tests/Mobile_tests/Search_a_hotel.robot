*** Settings ***
Library          AppiumLibrary
Resource         ../../resources/MobileKeywords.robot
Resource         ../mobile_tests/login.robot

*** Test Cases ***
Search a Hotel
    Launch application & Login
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible
    ${overlay_present}=    Run Keyword And Return Status    Check Overlay Present
    Run Keyword If    ${overlay_present}    Press Keycode    4  # Press back button if overlay present
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${designation}
    Designation
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${country_name}
    Enter country
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${select_city_from_drop_down}
    Select city
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${date_picker}
    Date picker
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${search}
    Search

