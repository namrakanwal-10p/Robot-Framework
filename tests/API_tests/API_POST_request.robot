*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}         http://localhost:3000


*** Test Cases ***
Create New Book
    Create Session    MySession    ${base_url}
    ${headers}=    Create Dictionary
    ${payload}=    Create Dictionary
    ...             title=Kaye
    ...             author=William Shakespeare
    ...             type=Fiction
    ...             dateAdded=Sun Sep 04 20:23:44 PKT 2022
    ${response}=    POST On Session    MySession    /books    data=${payload}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Log to console    ${response.text}

