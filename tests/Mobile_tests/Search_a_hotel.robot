*** Settings ***
Library          AppiumLibrary
Resource         ../../resources/MobileKeywords.robot
Resource         ../mobile_tests/login.robot

*** Test Cases ***
Search a Hotel
    Launch application & Login
    Wait Until Element Is Visible     ${destination}
    ${overlay_present}=    Run Keyword And Return Status    Check Overlay Present
    Run Keyword If    ${overlay_present}    Press Keycode    4  # Press back button if overlay present
    Wait Until Element Is Visible    ${destination}
    Sleep    5s
    Destination
    Sleep    20s
    Enter country
    Log to console    Country name entered: ${country_name}
    Sleep    5s
    Wait Until Element Is Visible    ${select_city_from_drop_down}
    Select city
    Wait Until Element Is Visible    ${date_picker}
    Date picker
    Wait Until Element Is Visible    ${search}
    Search
    Close Application
