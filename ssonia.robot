*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url}    https://sso.nia.or.th/account/register/
${browser}    gc
${locator_username}    id=id_username
${locator_email}    id=id_email
${locator_firstname}    id=id_first_name
${locator_lastname}    id=id_last_name    
${locator_password}    id=id_password1
${locator_confirm_password}    id=id_password2
${locator_btn_register}    id=register


*** Keywords ***

Open Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_username}

Input Data Register Pass
    Open Website
    Input Text    ${locator_username}    Prawee
    Input Text    ${locator_email}    m.prawee@gmail.com
    Input Text    ${locator_firstname}    Prawee
    Input Text    ${locator_lastname}    Marnop
    Input Text    ${locator_password}    12345678
    Input Text    ${locator_confirm_password}    12345678
    Click Element    ${locator_btn_register}



Input Data Register Fail
    [Arguments]      ${username}    ${email}    ${fname}    ${lname}    ${pwd}    ${cfpwd}    ${errormsg}    
    Open Website
    Input Text    ${locator_username}    ${username}    
    Input Text    ${locator_email}    ${email}
    Input Text    ${locator_firstname}    ${fname}    
    Input Text    ${locator_lastname}    ${lname}   
    Input Text    ${locator_password}    ${pwd}    
    Input Text    ${locator_confirm_password}    ${cfpwd}    
    Click Element    ${locator_btn_register}
    Close Browser    


*** Test Cases ***

Input data fail
    [Template]    Input Data Register Fail
    ${EMPTY}    m.prawee2@gmail.com    Prawee    Marnop    12345678    12345678    รองรับภาษาอังกฤษ ตัวเลข และอักษรพิเศษเฉพาะ -/_ เท่านั้น        
    Prawee/    ${EMPTY}    Prawee    Marnop    12345678    12345678    ฟิลด์นี้จำเป็น
    Prawee/    m.prawee3@gmail.com    Prawee    Marnop    ${EMPTY}    12345678    ฟิลด์นี้จำเป็น
    Prawee/    m.prawee4@gmail.com    Prawee    Marnop    12345678    ${EMPTY}    ฟิลด์นี้จำเป็น
    Prawee/    m.prawee5@gmail.com    Prawee    Marnop    12345678    12345    Enter the same password as before, for verification.        