*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}         http://localhost:3000


*** Test Cases ***
Update Existing Book
    Create Session    MySession    ${base_url}
    ${headers}=    Create Dictionary
    ${payload}=    Create Dictionary
    ...             title=Rob
    ...             author=Saad
    ...             type=Fiction
    ...             dateAdded=Sun Sep 04 20:23:44 PKT 2022
    ${response}=    PUT On Session     MySession    /books/12    data=${payload}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log to console    ${response.text}

