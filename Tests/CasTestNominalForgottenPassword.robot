*** Settings ***
Library    SeleniumLibrary
Library    csv

Variables    ../Locators/locators.py
Test Setup    Pre_conditions
Test Teardown    Close Browser
Test Template    Recuperer le mot de passe         
*** Variables ***
${URL}    http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome


*** Test Cases ***    Email     
Cas de test Nominal    salim.hamido@test.com

*** Keywords ***
Pre_conditions
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
Recuperer le mot de passe
    [Documentation]   l'utilisateur est en mesure de réinitialiser le mot de passe oublié
    [Arguments]     ${Email}  
    Click Element   ${Btn_myaccount}
    Wait Until Element Is Visible    ${Btn_myaccount}
    Click Element   ${Btn_login}
    Wait Until Element Is Visible    ${lnk_forgotten_password}
    Click Element   ${lnk_forgotten_password}
    Input Text   ${input_email_login}   ${Email}
    Click Element   ${btn_continue}
    Page Should Contain   An email with a confirmation link has been sent your email address.
