Feature: Pesquisa de Endereço

  Scenario: Pesquisar Endereço
    Given que o usuário está na página de pesquisa
    When usuário insere "rua da consolaçao, 42, 1931" na caixa de pesquisa
    And o usuário clica no botão "procurar"
    Then o usuário deve ver os resultados da pesquisa
