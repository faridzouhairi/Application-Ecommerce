*** Settings ***
Library    SeleniumLibrary
Library    csv

Variables    ../Locators/locators.py
Test Setup    Pre_conditions
Test Teardown    Close Browser
Test Template    Passer une commande     
*** Variables ***
${URL}    http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome
*** Test Cases ***    Search     
Cas de test Nominal    HP LP3065
*** Keywords ***
Pre_conditions
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
Passer une commande
    [Documentation]   l'utilisateur peut passer une commande
    [Arguments]     ${vSearch}     
    Input Text   ${search_box}   ${vSearch}    
    Click Button    ${btn_search}
    Wait Until Element Is Visible    ${link_element}
    #Mouse Down On Link    http://tutorialsninja.com/demo/index.php?route=product/product&product_id=33&search=Samsung+SyncMaster+941BW
    Click Element    ${link_element}
    Wait Until Element Is Visible    ${btn_view_checkout}
    Click Element    ${btn_view_checkout}
    Click Element     ${btn_total_cart}
    Wait Until Element Is Visible    ${btn_checkout}
    Click Element    ${btn_checkout}
    Wait Until Element Is Visible    ${input_email_login}
    Input Text    ${input_email_login}    salim.hamido@test.com
    Input Password    ${input_password_login}    Test@123
    Click Element   ${Btn_login_submit} 
    Wait Until Element Is Visible    ${link_Billing_Details}
    Click Element    ${link_Billing_Details}
    Wait Until Element Is Visible    ${firstname}
    Click Element   xpath://input[@value='new']
    Input Text    ${firstname}    salima
    Input Text    ${lastname}    hamida
    Input Text    ${address1}    12 rue salime
    Input Text    ${city}    casa
    Input Text    ${postcode}    123ccd3
    Select From List By Index    ${country}    1
    # Wait for 'Region / State' list to load after selecting country
    Sleep    1
    Select From List By Index    ${zone}    1
    Click Button    ${btn_continue}
    Wait Until Element Is Visible    ${btn_Delivery_Details}
    Click Element    ${btn_Delivery_Details}
    Click Button    ${btn_continue}
    Click Element    ${btn_Delivery_Method}
    Click Element    ${checkbox_conditions}
    Click Button    ${btn_continue}
    Click Button    ${confirm_order}