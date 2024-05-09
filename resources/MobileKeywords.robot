*** Settings ***
Library      AppiumLibrary
Variables       ../Variables/Locators/mobile_locators.py

*** Keywords ***
Click To Signin
    Click element    ${click_on_sign_in}

Click to email
    Click element    ${click_on_email_field}

Enter email
    Input text    ${email_field}   ${email_value}

Continue button
    Click element    ${continue_button}

Enter pass
    Input text    ${pass_field}    ${pass_value}

Click on signin button
    Click element    ${Sign_in}

Designation
    Click element     ${designation}

Enter country
     Input text     ${country_enter_field}  ${country_name}

Select city
    Click element    ${select_city_from_drop_down}

Date picker
    Click element    ${date_picker}

Search
    Click element     ${search}