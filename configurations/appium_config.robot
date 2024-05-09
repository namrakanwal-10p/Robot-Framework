*** Settings ***
Library           AppiumLibrary

*** Variables ***
${DEVICE_NAME}    emulator-5554
${PLATFORM_NAME}  Android
${PLATFORM_VERSION}  11
${APP_PACKAGE}    com.booking
${APP_ACTIVITY}   .MainActivity
${APPIUM_SERVER}  http://localhost:4723/wd/hub
${app}           C:\\Users\\namra.kanwal\\Downloads\\booking-com-35-5.apk

*** Test Cases ***
Launch App Test
    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${app}

    # Add a delay to wait for the app to fully load (optional)
    Wait Until Element Is Visible    id=com.booking:id/identity_landing_social_button    timeout=30 seconds

    # Click on an element in the app
    Click Element    id=com.booking:id/identity_landing_social_button

