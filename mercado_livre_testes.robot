*** Settings ***
Documentation    Essa suite testa o site da Mercadolivre.com.br
Resource         mercado_livre_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador




*** Variables ***
${URL}                https://www.mercadolivre.com.br/
${USERNAME}           felipealvesa1603@gmail.com
${PASSWORD}           ******

*** Keywords ***

Preparar teste
    Abrir o navegador
    Realizar login    ${USERNAME}    ${PASSWORD}

Fechar o navegador
    Close Browser  






*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Supermercado"
    [Documentation]    Esse teste verificar o menu supermercado do site da mercadolivre.com.br
    ...                e verifica a Categoria e Bebidas
    [Tags]            menus    categorias
    Acessar a home page do site mercadolivre.com.br
    Entrar no menu "Supermercado"
    Verificar se aparece a frase "NOSSAS CATEGORIAS"
    Verificar se aparece a categoria "BEBIDAS"
    

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Digitar o nome de produto "Super Nintendo Snes Original Completo 2 Controles E 1 Jogo" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Super Nintendo Snes Original Completo 2 Controles E 1 Jogo"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site mercadolivre.com.br
    Digitar o nome de produto "Super Nintendo Snes Original Completo 2 Controles E 1 Jogo" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Super Nintendo Snes Original Completo 2 Controles E 1 Jogo"
    Adicionar o "Super Nintendo Snes Original Completo 2 Controles E 1 Jogo" no carrinho
    Verificar se o produto "Super Nintendo Snes Original Completo 2 Controles E 1 Jogo" foi adicionado com sucesso
    