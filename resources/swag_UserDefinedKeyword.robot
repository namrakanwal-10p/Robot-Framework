*** Settings ***
Library         SeleniumLibrary
Variables     ../Variables/Locators/Swag_labs_locators.py


*** Keywords ***
Enter email
   Input text         ${username}   ${username_value}

Enter Password
   Input text         ${password}   ${password_value}

Click SignIn
   click button       ${sign_in}

Verify Shirt
   Element should contain   ${search_item_key}    ${search_value}

Click on desired item
   click element           ${search_item_key}
   sleep  5s

Add to cart a product
  click element         ${add_to_cart}
  click element         ${click_on_add_to_cart_icon}
  click element         ${click_on_check_out_button}
  input text            ${first_name}  ${fname}
  input text            ${last_name}   ${lname}
  input text            ${postal_code}  ${pcode}
  click element         ${click_on_continue}
  click element         ${checkout}

Thankyou Message
  page should contain   ${thankyou_message}

