*** Settings ***
Documentation    Essa suite testa o site da Mercadolivre.com.br
Resource         mercado_livre_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Supermercado"
    [Documentation]    Esse teste verificar o menu supermercado do site da mercadolivre.com.br
    ...                e verifica a Categoria e Bebidas
    [Tags]            menus    categorias
    Dado que estou na home page da Mercadolivre.com.br
    Quando acessar o menu "Supermercado"
    E o texto "NOSSAS CATEGORIAS" deve ser exibido na página
    

# Caso de teste 02 - Pesquisa de um Produto
#     [Documentation]    Esse teste verifica a busca de um produto
#     [Tags]             busca_produtos    lista_busca
#     Dado que estou na home page da Amazon.com.br
#     Quando pesquisar pelo produto "Xbox Series S"
#     Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
#     E um produto da linha "Xbox Series S" deve ser mostrado na página