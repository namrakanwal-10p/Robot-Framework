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
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${click_on_sign_in}
    Click To Signin
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${click_on_email_field}
    Click to email
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${email_field}
    Enter email
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible    ${continue_button}
    Continue button
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible     ${pass_field}
    Enter pass
    Wait Until Keyword Succeeds    10s    10s    Element Should Be Visible     ${Sign_in}
    Click on signin button
