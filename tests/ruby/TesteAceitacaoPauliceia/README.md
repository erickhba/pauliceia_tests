Nessa execução do Cucumber+Capybara, utilizamos o Ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x64-mingw-ucrt], e as gems utilizadas estão no Gemfile dessa pasta.

Para executar, com as gems e ruby instalados, é necessário editar o e-mail e senha utilizados nos arquivos "camada.feature" e "login_e_logout.feature" para a sua conta no pauliceia, e depois basta rodar o comando "cucumber" na pasta raiz.

Os testes incluem:
- Login e logout
- Criação de camada
- Edição de camada
- Apagar camadas

A log da ultima execução está no arquivo "execucao_testes.log".

Os testes estão apontando para a url 'http://localhost:8080' que é onde o frontend roda em ambiente de desenvolvimento.