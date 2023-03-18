*** Settings ***
Library    SeleniumLibrary
Library    csv

Variables    ../Locators/locators.py
Test Setup    Pre_conditions
Test Teardown    Close Browser
Test Template    Inscription avec tous les champs obligatoires                        
*** Variables ***
${URL}    http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome


*** Test Cases ***    Firstname   Lastname    Email    Telephone     Password    confirm_password
Cas de test Nominal     salim    hamid    salim.h1@test.com    1234567890    Test@123    Test@123
Cas de test Nominal2    salim    hamid    salim1.h2@test.com    1234567890    Test@123    Test@123
*** Keywords ***
Pre_conditions
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
Inscription avec tous les champs obligatoires
    [Documentation]   Vérifier que l'utilisateur peut s'inscrire en fournissant tous les champs obligatoires
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
    Page Should Contain   Your Account Has Been Created!
Inscription avec la newsletter
    [Documentation]   l'utilisateur peut s'inscrire à l'application en optant pour l'abonnement à la Newsletter
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
    Click Element    ${Chx_newsletter}
    Click Element   ${btn_agree}
    Click Element   ${btn_continu}
    Page Should Contain   Your Account Has Been Created!
