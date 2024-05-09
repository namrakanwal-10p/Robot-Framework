*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}         http://localhost:3000/books


*** Test Cases ***
Quick Get Request Test
    ${response}=    GET    ${base_url}     expected_status=200
    Log to console    ${response.text}

