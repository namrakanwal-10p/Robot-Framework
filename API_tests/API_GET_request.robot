*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}         https://reqres.in/api/users
${page_id}          2


*** Test Cases ***
Quick Get Request Test
    ${response}=    GET      ${base_url}     params=page=${page_id}   expected_status=200
    log    ${response.json()}
    Should Be Equal As Strings    6  ${response.json()}[per_page]
