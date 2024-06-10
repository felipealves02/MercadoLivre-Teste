*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${URL}                 https://www.mercadolivre.com.br/
${MENU_SUPERMERCADO}    //a[contains(.,'Supermercado')]
${HEADER_NOSSA_CATEGORIA}    //h2[contains(.,'Nossas categorias')]
${TEXTO_NOSSA_CATEGORIA}    Nossas categorias
${CATEGORIA_BEBIDAS}    //img[@alt='BEBIDAS_L1=1403']


*** Keywords ***

Abrir o navegador
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window
    
Fechar o navegador
    
    Close Browser    

Acessar a home page do site mercadolivre.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    locator=${MENU_SUPERMERCADO}    timeout=10s

Realizar login
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Click Element    locator=//a[@data-link-id='login']
    Input Text    locator=//input[@name='user_id']    ${USERNAME}
    Click Element    locator=//button[@type='submit']
    Input Password    locator=//input[@name='password']    
    Click Element    locator=//button[@type='submit']
    Wait Until Element Is Visible    locator=//a[@class='nav-icon-user']

Entrar no menu "Supermercado"
    Click Element    locator=${MENU_SUPERMERCADO}

Verificar se aparece a frase "NOSSAS CATEGORIAS"
    Wait Until Page Contains    text=${TEXTO_NOSSA_CATEGORIA}    timeout=10s
    Wait Until Element Is Visible    locator=${HEADER_NOSSA_CATEGORIA}    timeout=10s
    
Verificar se aparece a categoria "BEBIDAS"
    Wait Until Element Is Visible    ${CATEGORIA_BEBIDAS} 



Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=cb1-edit   text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=//button[@class='nav-search-btn']

Verificar o resultado da pesquisa se está listando o produto "${GAME}"
    Wait Until Element Is Visible    locator=//a[@title='${GAME}']    
    

# CASO 03

Adicionar o ${PRODUTO} no carrinho
    
    # Primeiro, clique no produto listado nos resultados da pesquisa
    Click Element    locator=:R2l5e6:   
    # Depois, clique no botão de adicionar ao carrinho na página do produto
    Wait Until Element Is Visible    locator=//button[contains(., 'Adicionar ao carrinho')]
    Click Element    locator=//button[contains(., 'Adicionar ao carrinho')]



Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Click Button    locator=:Rj86:
    Wait Until Element Is Visible    locator=button2
    Click Element    locator=button2

# GHERKIN STEPS

Dado que estou na home page da Mercadolivre.com.br
    Acessar a home page do site mercadolivre.com.br

Quando acessar o menu "Supermercado"
    Entrar no menu "Supermercado"
    

E o texto "NOSSAS CATEGORIAS" deve ser exibido na página
    Verificar se aparece a frase "NOSSAS CATEGORIAS"