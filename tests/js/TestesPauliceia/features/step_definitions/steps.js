const { Given, When, Then, And} = require('cucumber');
const { expect } = require('chai');
const { Builder, By, Key, until } = require('selenium-webdriver');
const assert = require('assert');




Given('que o usuário está na página de pesquisa', async function () {
  

  driver = await new Builder().forBrowser('chrome').build();


  await driver.get('https://pauliceia.unifesp.br/portal/explore');


});

When('usuário insere {string} na caixa de pesquisa', async function (address) {

    const caixaDePesquisa = await driver.findElement(By.css('.el-input__inner'));
    await caixaDePesquisa.clear();
    await caixaDePesquisa.sendKeys(address, Key.RETURN);

});

When('o usuário clica no botão {string}', async function (address) {

  const button = await driver.findElement(By.className('btn-search'));
  button.click();
});

Then('o usuário deve ver os resultados da pesquisa', async function () {
  // div da página principal: verificar se a página carregou na procura
  const resultadosElemento = await driver.findElement(By.css('.md-theme-default'));
  const resultadosVisiveis = await resultadosElemento.isDisplayed();
  assert(resultadosVisiveis, 'Os resultados da pesquisa não estão visíveis.');


});
