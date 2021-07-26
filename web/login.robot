***Settings
Documentation       Login no Site ConexãoQA

Resource            ../common/base.robot

Test Setup          Abrir sessão
Test Teardown       Fechar sessão

***Variables
${URL}      http://conexaoqa.herokuapp.com/login
${BROWSER}  internetexplorer

***Test Cases
Login com sucesso
    #Add Location Strategy	data-test   data-test
    Dado que estou no site do ConexãoQA
    Quando digitar meu usuário e senha 
    E clicar em logar
    Então devo ver a área logada

***Keywords
Dado que estou no site do ConexãoQA
    Go To       ${url}

Quando digitar meu usuário e senha 
    Input Text          name:email          dorb@gft.com
    Input Text          name:password       aP1212
    
E clicar em logar
    #Click Element       xpath://input[@class="btn btn-primary" and @type='submit']
    Click Element       css:[data-test='login-submit']

Então devo ver a área logada
    Wait Until Element is visible       xpath://h1[contains(text(), "Dashboard")]