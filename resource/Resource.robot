*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${BROWSER}      firefox
${URL}          http://automationpractice.com

*** keywords ***
Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

###Passo a passo
Dado que eu estou na pagina home do site
    Go To    http://automationpractice.com
    Title Should Be   My Store

Quando eu pesquisar pelo produto "Printed Chiffon Dress"
    Input Text    name=search_query   Printed Chiffon Dress

E clicar no botao de Pesquisa
    Click Element    name=submit_search

Entao o produto "Printed Chiffon Dress" deve ser listado na pagina de resultado de busca
    wait until Element is visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    Page Should Contain Link        xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a

Quando eu pesquisar pelo produto "ProdutoNaoExistente"
    Input Text    name=search_query    ProdutoNaoExistente

Entao a pagina deve exibir a mensagem "No results were found for your search "ProdutoNaoExistente""
    wait until Element is visible   id=search_query_top
    Element Text Should Be          css=#center_column > p    No results were found for your search "ProdutoNaoExistente"

Quando eu pesquisar pelo produto "t-shirt"
    Input Text    name=search_query    t-shirt

E adicionar o produto no carrinho
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Click Element                   xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Wait Until Element Is Visible   xpath=//*[@id="add_to_cart"]/button
    Click Button                    xpath=//*[@id="add_to_cart"]/button

Então a tela do carrinho deve ser mostrada juntamente cos dados e valores do produto
  Wait Until Element Is Visible   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
  Click Element                   xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
