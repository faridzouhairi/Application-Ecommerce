*** Settings ***
Library    SeleniumLibrary
Library    csv

Variables    ../Locators/locators.py
Test Setup    Pre_conditions
Test Teardown    Close Browser
Test Template    L'utilisateur ne peut pas enregistrer un compte en double                        
*** Variables ***
${URL}    http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome


*** Test Cases ***    Firstname   Lastname    Email    Telephone     Password    confirm_password
Cas de test Exception    salim    hamid    salim.hamido@test.com    1234567890    Test@123    Test@123

*** Keywords ***
Pre_conditions
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
L'utilisateur ne peut pas enregistrer un compte en double
    [Documentation]   L'utilisateur ne peut pas enregistrer un compte en double.
    [Arguments]     ${Firstname}     ${Lastname}    ${Email}    ${Telephone}    ${Password}    ${confirm_password}
    Click Element   ${Btn_myaccount}
    Wait Until Element Is Visible    ${Btn_myaccount}
    Click Element   ${Btn_enregistrer}
    Input Text   ${input_Firstname}   ${Firstname}
    Input Text   ${input_Lastname}   ${Lastname}
    Input Text   ${input_Email}      ${Email}
    Input Text   ${input_Telephone}   ${Telephone}
    Input Text   ${input_Password}    ${Password}
    Input Text   ${input_confirm_password}    ${confirm_password}
    Click Element   ${btn_agree}
    Click Element   ${btn_continu}
    Page Should Contain   Warning: E-Mail Address is already registered!