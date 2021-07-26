***Settings
Documentation       Cadastro no Site SeuBarriga
Resource            ../common/base.robot
Test Teardown       Fechar sessão 

***Variables
${URL}              https://seubarriga.wcaquino.me/cadastro
${BROWSER}          headlesschrome

***Test Cases
Cadastrar Usuário
    #Arrange 
    Open Browser       ${URL}       ${BROWSER}                

    ${numAleatorio}=            Random.aleatorioDe1a10000
    ${numAleatorioStr}=         Convert To String       ${numAleatorio}
    #Log to console             ${numAleatorioStr} 

    ${senhaUsuarioCriado}=      Evaluate    ${numAleatorioStr}   
    Set Global Variable         ${senhaUsuarioCriado}

    ${nomeUsuarioCriado}=       Catenate    usuario${numAleatorioStr}
    Set Global Variable         ${nomeUsuarioCriado}

    ${emailUsuarioCriado}=      Catenate    usuario${numAleatorioStr}@email.com
    Set Global Variable         ${emailUsuarioCriado}

    #Act
    Input Text         nome         ${nomeUsuarioCriado}
    Input Text         //input[@type="email" and @placeholder='Email']          ${emailUsuarioCriado}
    Input Text         Identifier:senha         ${senhaUsuarioCriado}
    Click Element      Class:btn-primary
    #Assert
    Então sistema deve exibir mensagem "Usuário inserido com sucesso"
    Sleep              5
    #Title Should Be    Seu Barriga - Novo Usuário