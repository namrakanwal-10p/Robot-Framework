*** Settings ***
Library           SeleniumLibrary
Variables        ../variables/Locators/Website_locators.py


*** Keywords ***
Enter email
   Input text         ${username}   ${username_value}

Enter Password
   Input text         ${password}   ${password_value}

Click SignIn
   click button       ${sign_in}

Alert widget
   Click element    ${Alert_widget}

Alert menu
   Click element    ${Alert_menu}

Alert button
   Click element    ${Alert_button}

Click me button
   Click button    ${click_me}

Click on widget
   Click element      ${widgets}

Click on date Picker
   Click element      ${Click_on_date_picker}

Select_Date_field
   Click element     ${Select_Date_field}
Select month
   Click element      ${Select_month}

Click on month
   Click element      ${Click_month}

Click on year
    Click element    ${Click_on_year}

Select year
    Click element    ${Select_year}

Click on date
    Click element    ${Click_on_date}

Click on interaction
    Click element    ${interaction_widget}

click_on_sortable
    Click element    ${click_on_sortable}

Click on grid
    Click element    ${Click_grid}

Click on search
    Click button    ${click_on_search_button}

Click on book store application
    Click element    ${click_book_store}

Click on login
    Click element    ${login_button}

Enter Username of customer
    Input text    ${username_of_user}     ${input_username}

Enter Password of customer
    Input text    ${pass_of_user}      ${input_pass}