*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://sso.nia.or.th/account/register/
${browser}    chrome
${username}    id=id_username
${email}    id=id_email
${name}    id=id_first_name
${surname}    id=id_last_name
${password}    id=id_password1
${confirm-password}    id=id_password2
${btn-register}    id=register

*** Test Cases ***

Open sso browser
    Open Browser    ${url}    gc
    Maximize Browser Window
    Wait Until Element Is Visible    ${username}

Input Data Register
    Input Text    ${username}    prawee
    Input Text    ${email}    m.prawee@gmail.com
    Input Text    ${name}    Prawee
    Input Text    ${surname}    Marnop
    Input Text    ${password}    12345678
    Input Text    ${confirm-password}    12345678
    Click Button    ${btn-register}

Input Data Register Failed
    [argurement]



*** Test Cases ***
