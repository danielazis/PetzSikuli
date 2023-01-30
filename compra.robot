*** Settings ***
Documentation    Fluxo de compra no site da Petz


Library    SikuliLibrary

Suite Setup    Add Image Path    ${EXECDIR}\\resources\\images
Suite Teardown    Stop Remote Server

*** Test Cases ***
Compra
    [Tags]   SMOKE
    Dado que acesso o site da Petz
    Quando pesquiso o produto "pote"
    Entao visualizo o produto
    Quando seleciono o produto
    E adiciono duas unidades ao carrinho
    Entao visualizo o produto e o total no carrinho


*** Keywords ***
Dado que acesso o site da Petz
    Click    icone_do_chrome.png
    Sleep    1s
    Input text    ${EMPTY}  https://www.petz.com.br
    Press Special Key    ENTER

Quando pesquiso o produto "pote"
    Input text    pesquisar_campo.png  pote
    Click    lupa.png

Entao visualizo o produto
    Wait For Image    pote.png    ${EMPTY}    5
Quando seleciono o produto
    Click    pote.png
E adiciono duas unidades ao carrinho
    Click    adicionaprod.png
    Screen Should Contain    qtdprod.png
    Click    adccarrinho.png
Entao visualizo o produto e o total no carrinho
    Wait For Image    prodlist.png    ${EMPTY}    5
    Screen Should Contain    qtdcheck.png
    Screen Should Contain    totalpreco.png
    Click    excluip.png
    Click    confirmadel.png
    Sleep    2s
    Click    fechar.png
