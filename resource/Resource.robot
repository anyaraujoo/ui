*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${BROWSER}      firefox
${URL}          http://automationpractice.com

*** keywords ***
Open navigator
    Open Browser    about:blank   ${BROWSER}

Close navigator
    Close Browser

###Passo a passo
Given that I'm on the home page of the site
    Go To    http://automationpractice.com
    Title Should Be   My Store

When I search for "Printed Chiffon Dress"
    Input Text    name=search_query   Printed Chiffon Dress

And click on the Search button
    Click Element    name=submit_search

Then the product "Printed Chiffon Dress" should be listed on the search result page
    wait until Element is visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    Page Should Contain Link        xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a

When I search for the product "ProductNonExistent"
    Input Text    name=search_query    ProdutoNaoExistente

Then the page should display the message "No results were found for your search "ProductNonExistent""
    wait until Element is visible   id=search_query_top
    Element Text Should Be          css=#center_column > p     No results were found for your search "ProdutoNaoExistente"

When I search for the product "t-shirt"
    Input Text    name=search_query    t-shirt

And add the product to the cart
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Click Element                   xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Wait Until Element Is Visible   xpath=//*[@id="add_to_cart"]/button
    Click Button                    xpath=//*[@id="add_to_cart"]/button

Then the cart screen should be shown together with the product data and values
    Wait Until Element Is Visible   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
    Click Element                   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
