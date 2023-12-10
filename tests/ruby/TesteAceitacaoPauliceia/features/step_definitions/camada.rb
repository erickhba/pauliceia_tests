Dado('que eu visito o site do pauliceia {string}') do |link|
  visit link
end

Dado('faço login com minha conta com email {string} e senha {string}') do |email, senha|
  botao_entrar = find('#navbarCollapse a.btn-login')
  botao_entrar.click

  sleep(1)
  expect(current_url).to eql('http://localhost:8080/portal/login')

  campo_email = find('.form-signin .form-control[placeholder="E-mail"]')
  campo_email.fill_in with: email

  campo_senha = find('.form-signin .form-control[placeholder="Senha"]')
  campo_senha.fill_in with: senha

  sleep(1)
  find('.form-signin .btn[type="submit"]').click
  
  sleep(1)
  expect(current_url).to eql('http://localhost:8080/portal/explore')
end

Dado('consigo entrar no painel de camada no botao de navegação') do
  botao_usuario = find('#navbarCollapse button[md-menu-trigger]')
  botao_usuario.click

  botao_painel = find('.md-menu-content-bottom-start a.md-list-item-router span', :text => "Painel")
  botao_painel.click

  sleep(1)
  expect(current_url).to eql("http://localhost:8080/portal/dashboard/home")
end

Dado('que eu visito o painel de criação de camada') do
  botao_nova_camada = find('.md-drawer a.md-list-item-router span', :text => "Nova Camada")
  botao_nova_camada.click

  sleep(1)
  expect(current_url).to eql("http://localhost:8080/portal/dashboard/newLayer")
end

Quando('eu preencher o campo da camada com o nome {string} e descricao {string}') do |nome, descricao|
  fill_in 'inputName', :with => nome
  fill_in 'inputDescription', :with => descricao
end

Quando('adicionar referencia {string}') do |ref|
  fill_in 'inputReference', :with => ref
  botao_add_ref = find('a.btn.styleBtn', :text => "Adicionar Referência")
  botao_add_ref.click
  sleep(1)
  expect(page).to have_selector('label[for="inputReference"]', visible: true)
end

Quando('utilizar a palavra chave {string}') do |keyword|
  campo_palavra_chave = find('#keywordsSelect input')
  campo_palavra_chave.fill_in with: keyword
  find_campo = find('#keywordsSelect ul.dropdown-menu li', text: keyword)
  find_campo.click()
end

Quando('selecionar o colaborador {string}') do |colaborador|
  campo_colaborador = find('#userSelect input')
  campo_colaborador.fill_in with: colaborador

  find_campo = find('#userSelect ul.dropdown-menu li', text: colaborador)
  find_campo.click()
end

Quando('subir o arquivo de entrada {string}') do |arquivo|
  path = "features/resources/"+arquivo+".zip"

  find(:label, for: 'Upload', match: :first).click
  page.attach_file(path, make_visible: true)
end

Quando('clicar no botão para enviar') do
  botao_enviar = find('.card-right button.btn.styleBtn', :text => "Enviar")
  botao_enviar.click

  sleep(8)
end

Quando('preencher a coluna de data: {string} com formato {string}') do |coluna, mascara|
  fill_in 'start_date', :with => "01/01/1930"
  fill_in 'end_date', :with => "31/12/1940"

  
  campo_coluna = find('#start_date_column_name input')
  campo_coluna.fill_in with: coluna

  find_campo = first('#start_date_column_name ul.dropdown-menu li', exact_text: coluna)
  find_campo.click()

  campo_formato = find('#start_date_mask input')
  campo_formato.fill_in with: mascara

  find_campo = first('#start_date_mask ul.dropdown-menu li', exact_text: mascara)
  find_campo.click()

  campo_coluna = find('#end_date_column_name input')
  campo_coluna.fill_in with: coluna

  find_campo = first('#end_date_column_name ul.dropdown-menu li', exact_text: coluna)
  find_campo.click()

  campo_formato = find('#end_date_mask input')
  campo_formato.fill_in with: mascara

  find_campo = first('#end_date_mask ul.dropdown-menu li', exact_text: mascara)
  find_campo.click()
end

Quando('clicar em enviar novamente') do
  find('a.btn.btn-primary', :text => "Enviar").click
end

Então('minha camada vai ter sido criada') do
  sleep(2)
  expect(current_url).to eql("http://localhost:8080/portal/dashboard/home")
end

Dado('que eu tenha uma camada {string} no pauliceia') do |nome|
  botao_nova_camada = find('.md-drawer a.md-list-item-router span', :text => "Inicio")
  botao_nova_camada.click

  sleep(1)
  expect(current_url).to eql("http://localhost:8080/portal/dashboard/home")
  expect(page).to have_selector('.card-body .card-text .col-sm-7', exact_text: nome, visible: true)
end

Quando('eu clicar no botão de editar a camada {string}') do |nome|
  nome_camada = find('.card-body .card-text .col-sm-7', exact_text: nome)

  edit_camada = nome_camada.sibling(".col-sm-5").find('.btn.btn-outline-dark.btn-sm.add')
  edit_camada.click
end

Quando('conseguir acessar o formulario dessa camada') do
  sleep(4)
  expect(current_url).to eql("http://localhost:8080/portal/dashboard/editLayer")
end

Então('consigo editar a camada e seus dados temporais') do
  fill_in 'inputDescription', with: "teste editado"

  fill_in 'inputReference', :with => "nova referencia"
  botao_add_ref = find('a.btn.btn-primary', :text => "Adicionar Referência")
  botao_add_ref.click

  botao_salvar = find('a.btn.btn-primary', :text => "Enviar")
  botao_salvar.click

  sleep(4)
  fill_in 'start_date', :with => "30/12/1900"
  fill_in 'end_date', :with => "01/01/1930"
  find('a.btn.btn-primary', :text => "Enviar").click

  sleep(4)
  expect(current_url).to eql("http://localhost:8080/portal/dashboard/home")
end

Quando('eu clicar no botão de excluir a camada {string}') do |nome|
  nome_camada = find('.card-body .card-text .col-sm-7', exact_text: nome)

  excluir_camada = nome_camada.sibling(".col-sm-5").find('.btn.btn-outline-danger.btn-sm.add2')
  excluir_camada.click
end

Então('minha camada {string} vai ser excluida') do |nome|
  sleep(2)
  expect(page).to have_no_css('.card-body .card-text .col-sm-7', exact_text: nome)
end