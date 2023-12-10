# encoding: utf-8
# language: pt
Funcionalidade: Controle de Camada

  Contexto:
    Dado que eu visito o site do pauliceia "http://localhost:8080/portal/home"
    E faço login com minha conta com email "isael.lucas@usp.br" e senha "senha_utilizada"
    E consigo entrar no painel de camada no botao de navegação


  Cenário: Criar uma camada no pauliceia
    Dado que eu visito o painel de criação de camada
    Quando eu preencher o campo da camada com o nome <nome> e descricao <descricao>
    E adicionar referencia "referencias teste"
    E utilizar a palavra chave "EACH"
    E selecionar o colaborador "testeEACH"
    E subir o arquivo de entrada <arq_entrada>
    E clicar no botão para enviar
    E preencher a coluna de data: <data_col> com formato <mascara>
    E clicar em enviar novamente
    Então minha camada vai ter sido criada
    

    Exemplos:
      | nome                | descricao              | arq_entrada                | data_col     | mascara        |
      | 'Camada de teste 1' | 'descricao do teste 1' | 'teste linha 1930-1940'    | 'data'       | 'YYYY-MM-DD'   |
      | 'Camada de teste 2' | 'descricao do teste 2' | 'TESTE PONTOS 1930-1940'   | 'data'       | 'YYYY-MM-DD'   |

  Cenário: Editar uma camada no pauliceia
    Dado que eu tenha uma camada <nome> no pauliceia
    Quando eu clicar no botão de editar a camada <nome>
    E conseguir acessar o formulario dessa camada
    Então consigo editar a camada e seus dados temporais

    Exemplos:
      | nome                |
      | 'Camada de teste 1' |
      | 'Camada de teste 2' |

  Cenário: Apagar uma camada no pauliceia
    Dado que eu tenha uma camada <nome> no pauliceia
    Quando eu clicar no botão de excluir a camada <nome>
    Então minha camada <nome> vai ser excluida

    Exemplos:
      | nome                |
      | 'Camada de teste 1' |
      | 'Camada de teste 2' |