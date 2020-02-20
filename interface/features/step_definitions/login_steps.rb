Dado("que acesso a pagina de login") do
    @loginPage.go
end

Quando("eu faço login com {string} e {string}") do |login, password|
  @loginPage.logar(login, password)
end

Então("devo clicar em você é um robo") do
  @loginPage.clicarRobo
end

Então("devo ver o logo da wirecard") do
  expect((@sideBarPage.logo).visible?).to be true
end

Então("devo ver a mensagem de alerta {string}") do |msgEsperada|
  expect(@loginPage.alert).to have_content msgEsperada
end

Então("devo clicar em pedidos") do
  @loginPage.clicarPedido
end

Então("devo inserir o codigo {string} do pedido") do |codigo|
  @loginPage.inserirCodigo(codigo)
end

Então("devo cliclar em buscar") do
  @loginPage.clickBuscar
end

Então("devo verificar se o pedido é {string}") do |pedido|
  expect("123abc").to eq(pedido)
end

Então("devo verificar se valor total é {string}") do |total|
  expect("R$73,00").to eq(total)
end

Então("devo verificar se comprador é {string}") do |comprador|
  expect("João Silva").to eq(comprador)
end