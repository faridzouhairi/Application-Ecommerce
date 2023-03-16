*** Settings ***
Library    SeleniumLibrary
Library    csv

Variables    ../Locators/locators.py
Test Setup    Pre_conditions
Test Teardown    Close Browser
Test Template    Se connecter avec un login valide          
*** Variables ***
${URL}    http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome


*** Test Cases ***    Email    Password    
Cas de test Nominal    salim.hamido@test.com    Test@123

*** Keywords ***
Pre_conditions
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
Se connecter avec un login valide
    [Documentation]   l'utilisateur peut se connecter avec des informations d'identification valides
    [Arguments]     ${Email}    ${Password} 
    Click Element   ${Btn_myaccount}
    Wait Until Element Is Visible    ${Btn_myaccount}
    Click Element   ${Btn_login}
    Input Text   ${input_email_login}   ${Email}
    Input Text   ${input_password_login}   ${Password}
    Click Element   ${Btn_login_submit}
    Page Should Contain   My Account
Logout
    Click Element    ${btn_logout}