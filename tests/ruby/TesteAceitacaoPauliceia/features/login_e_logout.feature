# encoding: utf-8
# language: pt
Funcionalidade: Login e Logout

  Cenário: Fazer login e logout no pauliceia
    Dado que eu visito o site "http://localhost:8080/portal/login"
    Quando eu preencher o campo de email com <email> e o de senha com <senha>
    E clicar no botão para entrar
    Então meu usuario vai ser autenticado
    Quando eu clicar no botão de sair
    Então meu usuario vai sair

    Exemplos:
      | email                   | senha           |
      | 'isael.lucas@usp.br'    | 'senha_utilizada'  |