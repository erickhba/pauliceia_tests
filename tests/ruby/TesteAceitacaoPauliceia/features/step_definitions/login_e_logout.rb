Dado('que eu visito o site {string}') do |link|
    visit link
end

Quando('eu preencher o campo de email com {string} e o de senha com {string}') do |email, senha|
    campo_email = find('.form-signin .form-control[placeholder="E-mail"]')
    campo_email.fill_in with: email

    campo_senha = find('.form-signin .form-control[placeholder="Senha"]')
    campo_senha.fill_in with: senha
end

Quando('clicar no botão para entrar') do
    sleep(1)
    find('.form-signin .btn[type="submit"]').click
end

Então('meu usuario vai ser autenticado') do
    sleep(1)
    expect(current_url).to eql('http://localhost:8080/portal/explore')
end
  
Quando('eu clicar no botão de sair') do
    botao_usuario = find('#navbarCollapse button[md-menu-trigger]')
    botao_usuario.click

    botao_sair = find('.md-menu-content-bottom-start button.md-list-item-button span', :text => "Sair")
    botao_sair.click
end
  
Então('meu usuario vai sair') do
    sleep(1)
    expect(find('#navbarCollapse a.btn-login').text).to eql('Entrar')
end
  