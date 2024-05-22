*** Settings ***
Library           AppiumLibrary
Resource         ../../resources/MobileKeywords.robot

*** Variables ***
${APPIUM_SERVER}    http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${APP_PACKAGE}      com.booking
${APP_ACTIVITY}     com.booking.deeplink.decoder.TaxisDeeplinkActivityDecoder
${APP_PATH}         D:/MyWork/booking-com-35-5.apk

*** Keywords ***
Launch application & Login

    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    app=${APP_PATH}
    Sleep    5s
    Wait Until Element Is Visible        ${click_on_sign_in}
    Click To Signin
    Wait Until Element Is Visible      ${click_on_email_field}
    Click to email
    Wait Until Element Is Visible      ${email_field}
    Enter email
    Wait Until Element Is Visible      ${continue_button}
    Continue button
    Sleep    4s
    Wait Until Element Is Visible       ${pass_field}
    Enter pass
    Wait Until Element Is Visible       ${Sign_in}
    Click on signin button
