Dado("que acesso a pagina de login") do
  @loginPage.go
end
Quando("eu faço login com {string} e {string}") do |login, password|
  @loginPage.logar(login, password)
end
Então("devo ver a mensagem de alerta {string}") do |msgEsperada|
  expect(@loginPage.alert).to have_content msgEsperada
end
Dado("que sou um usuário logado") do
    @loginPage.go
    @loginPage.logar("gbl_marcelino@hotmail.com", "gbl69gbl")
    expect((@sideBarPage.logo).visible?).to be true
end
Quando("busco o id do pedido {string}") do |pedido|
  @loginPage.clicarPedido
  @loginPage.inserirCodigo(pedido)
  @loginPage.clickBuscar
end
Então("devo verificar se o pedido é {string}") do |pedido|
  expect(pedido).to eq("123abc")
end
Então("devo verificar se valor total é {string}") do |total|
  sleep 5
  expect(total).to eq("R$73,00")
end
Então("devo verificar se comprador é {string}") do |comprador|
  expect(comprador).to eq("João Silva")
end