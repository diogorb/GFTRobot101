***Variables
${URL}              https://seubarriga.wcaquino.me/cadastro
${BROWSER}          headlesschrome

***Keywords
Abrir sessão
    Open Browser       ${URL}       ${BROWSER}      

Então sistema deve exibir mensagem "${mensagem}"
    #Wait Until Element Is Visible       //span[text()=contains(., '${mensagem}' )]
    Wait Until Element Is Visible       xpath://*[normalize-space(text())='${mensagem}'] 

Fechar sessão
    Capture Page Screenshot
    Close Browser