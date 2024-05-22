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
    Sleep    4s
    Destination
    Wait Until Element Is Visible      ${country_name}
    Enter country
    Wait Until Element Is Visible     ${select_city_from_drop_down}
    Select city
    Wait Until Element Is Visible      ${date_picker}
    Date picker
    Wait Until Element Is Visible     ${search}
    Search
