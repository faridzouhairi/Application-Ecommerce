*** Settings ***
Library    SeleniumLibrary
Library    csv

Variables    ../Locators/locators.py
Test Setup    Pre_conditions
Test Teardown    Close Browser
Test Template    Rechercher un produit qui n'existe pas      
*** Variables ***
${URL}    http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome


*** Test Cases ***    Search     
Cas de test Exception     tortue ninja
*** Keywords ***
Pre_conditions
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
Rechercher un produit qui n'existe pas 
    [Documentation]   l'utilisateur est en mesure de rechercher des produits
    [Arguments]     ${vSearch}     
    Input Text   ${search_box}   ${vSearch}    ENTER
    ${title}=       Get Title
    Log To Console             ${title}
    #Page Should Contain   There is no product that matches the search criteria.