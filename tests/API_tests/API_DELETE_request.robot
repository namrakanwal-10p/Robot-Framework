*** Settings ***
Library     RequestsLibrary
Library    Collections


*** Variables ***
${base_url}         http://localhost:3000
${book_id}          12


*** Test Cases ***
Delete Book With JWT Token
    ${jwt_token}=  Get Authentication Token
    ${headers}=    Create Dictionary    Authorization=${jwt_token}
    ${response}=    DELETE On Session    MySession    ${base_url}/books/${book_id}    headers=${headers}


*** Keywords ***
Get Authentication Token
    Create Session    MySession    ${base_url}
    ${response}=    POST On Session    MySession    books/authToken
    ${jwt_token}=    Set Variable    ${response.json()['jwtToken']}  # Assuming the JWT token is stored under the 'jwtToken' key
    Return From Keyword        ${jwt_token}

