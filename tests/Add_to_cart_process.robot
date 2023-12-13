*** Settings ***
Library              SeleniumLibrary
Resource          ../resources/CommonFunctionality.robot
Resource          ../resources/swag_UserDefinedKeyword.robot
Resource          ./login.robot


*** Test Cases ***
Search the desired product
  [Documentation]  This case search the desired product
  [Tags]  Functional

    Start testcase
    swag_UserDefinedKeyword.Enter email
    swag_UserDefinedKeyword.Enter Password
    swag_UserDefinedKeyword.Click SignIn
    execute javascript  window.scrollTo(0,400)
    Wait until element is not visible  swag_UserDefinedKeyword.Verify filter results
    Finish testcase

Add to cart process
  [Documentation]  This case add a product to cart
  [Tags]  Functional

    Start testcase
    swag_UserDefinedKeyword.Enter email
    swag_UserDefinedKeyword.Enter Password
    swag_UserDefinedKeyword.Click SignIn
    swag_UserDefinedKeyword.Click on desired item
    sleep  2s
    swag_UserDefinedKeyword.Add to cart a product
    sleep  5s
    swag_UserDefinedKeyword.Thankyou message
    Finish testcase
