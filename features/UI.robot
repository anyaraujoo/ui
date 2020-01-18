*** Settings ***

Resource          ../resource/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador


*** Test Case ***

Cenario 01: Pesquisar produto existente
      Dado que eu estou na pagina home do site
      Quando eu pesquisar pelo produto "Printed Chiffon Dress"
      E clicar no botao de Pesquisa
      Entao o produto "Printed Chiffon Dress" deve ser listado na pagina de resultado de busca

Cenario 02: Pesquisar produto não existente
      Dado que eu estou na pagina home do site
      Quando eu pesquisar pelo produto "ProdutoNaoExistente"
      E clicar no botao de Pesquisa
      Entao a pagina deve exibir a mensagem "No results were found for your search "ProdutoNaoExistente""

Cenario 03: Adicionar Produtos no carrinho
      Dado que eu estou na pagina home do site
      Quando eu pesquisar pelo produto "t-shirt"
      E adicionar o produto no carrinho
      Então a tela do carrinho deve ser mostrada juntamente cos dados e valores do produto
