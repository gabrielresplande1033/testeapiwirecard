require 'json'
filePedido = File.read(File.join(Dir.pwd, "features/support/fixtures/pedido.json"))
pedido = JSON.parse(filePedido.force_encoding("UTF-8"))
filePagamento = File.read(File.join(Dir.pwd, "features/support/fixtures/pagamento.json"))
pagamento = JSON.parse(filePagamento.force_encoding("UTF-8"))

Dado("o endereço da API para manter o cadastro de um pedido") do
end

Quando("realizar uma requisição para cadastrar um pedido") do
  $response = @testeapi.postPedidoCompleto
end

Então("a API irá retornar os dados do cadastro do pedido respondendo o código {int}") do |int|
  expect($response.code).to eq(201)
  puts "response code: #{$response.code}"
  expect($response.message).to eq("Created")

  puts "ID Response : #{$response["id"]}"
  puts "OwnID : #{$response["ownId"]}"
  puts "Items : #{$response["items"]}"
  puts "Customer : #{$response["customer"]["fullname"]}"
end

Dado("o endereço da API para retornar um pedido") do
end

Quando("realizar uma requisição passando o ID do pedido") do
  $get = @testeapi.getPedido($response["id"])
end

Então("a API irá retornar os dados do pedido correspondente respondendo o código {int}") do |int|
  expect($get.code).to eq(int)
  puts "Code Get: #{$get.code}"
  expect($get.message).to eq("OK")
  puts "ID Get: #{$get["id"]}"
  puts "Message Get: #{$get.message}"
  expect($get["id"]).to eq($response["id"])
end

Dado("o endereço da API para cadastrar um Pagamento") do
end

Quando("realizar uma requisição passando o ID do Pedido") do
  $pagamentoCadastrado = @testeapi.postPagamento($get["id"])
end

Então("a API irá retornar os dados do pagamento correspondente respondendo o código {int}") do |statusCode|
  puts "Pagamento Code: #{$pagamentoCadastrado.code}"
  puts "Pagamento ID: #{$pagamentoCadastrado["id"]}"
  puts "Pagamento Mensagem: #{$pagamentoCadastrado.message}"
  expect($pagamentoCadastrado.message).to eq("Created")
  expect($pagamentoCadastrado.code).to eq(statusCode)


end

Dado("o endereço da API para consultar um Pagamento") do
end

Quando("realizar uma requisição passando o ID do Pagamento") do
  $getPagamento = @testeapi.getPagamento($pagamentoCadastrado["id"])
end

Então("a API irá retornar os dados do pagamento correspondente constando o código {int}") do |statusGetPagamento|
  puts "Pagamento ID: #{$getPagamento["ID"]}"
  expect($getPagamento.code).to eq(statusGetPagamento)
  puts "Pagamento GetMessage: #{$getPagamento.message}"
  puts "Pagamento code: #{$getPagamento.code}"
end

Quando("realizar uma requisição para cadastrar uma startup Sem Parametro") do
   $cadastroStartupSemParametro = @testeapi.postStartupSemParametroId
end

Então("a API irá retornar o erro {int}") do |int|
  puts "Cadastro sem parametro: #{$cadastroStartupSemParametro.code}"
  puts "Cadastro sem parametro: #{$cadastroStartupSemParametro.message}"
  puts "Customer : #{$cadastroStartupSemParametro["errors"]}"
  puts "Customer : #{$cadastroStartupSemParametro["errors"][0]["code"]}"

  resultado = "#{$cadastroStartupSemParametro.body.force_encoding("UTF-8").to_json}"
  
end

Dado("que tenho o pedido sem o parâmetro {string}") do |string|
end

Quando("realizar uma requisição para inserir um pedido sem o parâmetro OwnId") do
  $response = @testeapi.postPedidoParaErros(pedido["SemOwnId"].to_json)
end

Então("a API irá retornar a seguinte mensagem de erro {string}") do |string|
  expect($response["errors"][0]["description"]).to eq(string)
end

Dado("que tenho o pedido com OwnId {string}") do |string|
end

Quando("realizar uma requisição para inserir um pedido com mais de {int} caracteres") do |int|
  $response2 = @testeapi.postPedidoParaErros(pedido["ComOwnIdMaisQue45Caracteres"].to_json)
end

Então("a API irá retornar a mensagem de erro {string}") do |string|
  puts $response2
  expect($response2["errors"][0]["description"]).to eq(string)
end

Dado("que tenho o pedido {string}") do |string|
end

Quando("realizar uma requisição para inserir um pedido sem item") do
  $response3 = @testeapi.postPedidoParaErros(pedido["SemItem"].to_json)
end

Então("a API retornará a mensagem de erro {string}") do |string|
  puts $response3
  expect($response3["errors"][0]["description"]).to eq(string)
end

Dado("que tenho um pedido {string}") do |string|
end

Quando("realizar uma requisição para inserir um pedido sem nome do produto") do
  $response4 = @testeapi.postPedidoParaErros(pedido["SemNomeDoProduto"].to_json)
end

Então("a API retornará a seguinte mensagem de erro {string}") do |string|
  puts $response4
  expect($response4["errors"][0]["description"]).to eq(string)
end

Dado("que tenho o pedido em que {string}") do |string|
end

Quando("realizar uma requisição para inserir um pedido com o item sem valor") do
  $response5 = @testeapi.postPedidoParaErros(pedido["SemValorNoItem"].to_json)
end

Então("a API responderá com a seguinte mensagem de erro {string}") do |string|
  puts $response5
  expect($response5["errors"][0]["description"]).to eq(string)
end

Dado("que tenho o pagamento em que {string}") do |string|
end

Quando("realizar uma requisição para inserir um pagamento em que a data do portador do cartão é inválida") do
  $postPagamentoInvalido = @testeapi.postPagamentoInvalido(pagamento["DataNascimentoPortadorInvalida"].to_json)
end

Então("a API responderá a seguinte mensagem de erro {string}") do |string|
  puts $postPagamentoInvalido
  expect($postPagamentoInvalido["errors"][0]["description"]).to eq(string)
end

Dado("que tenho o pagamento com o {string}") do |string|
end

Quando("realizar uma requisição para inserir um pagamento o CPF não possui {int} digitos") do |int|
  $postPagamentoInvalido2 = @testeapi.postPagamentoInvalido(pagamento["CPFInvalido"].to_json)
end

Então("a API retornara o erro {string}") do |string|
  puts $postPagamentoInvalido2
  expect($postPagamentoInvalido2["errors"][0]["description"]).to eq(string)
end

Dado("que tenho um pagamento com um {string}") do |string|
end

Quando("realizar uma requisição para inserir um pagamento em que o número de cartão é inválido") do
  $postPagamentoInvalido3 = @testeapi.postPagamentoInvalido(pagamento["NumeroDeCartaoInvalido"].to_json)
end

Então("a API deverá retornar o erro {string}") do |string|
  puts $postPagamentoInvalido3
  expect($postPagamentoInvalido3["errors"][0]["description"]).to eq(string)
end

Dado("que tenho um pagamento com uma {string}") do |string|
end

Quando("realizar uma requisição para inserir um pagamento em a data de expiração do cartão de crédito é inválida") do
  $postPagamentoInvalido4 = @testeapi.postPagamentoInvalido(pagamento["DataDeExpiracaoInvalida"].to_json)
end

Então("a API deverá retornar a mensagem de erro {string}") do |string|
  puts $postPagamentoInvalido4
  expect($postPagamentoInvalido4["errors"][0]["description"]).to eq(string)
end

Dado("que tenho um pagamento em que o {string}") do |string|
end

Quando("realizar uma requisição para inserir um pagamento em o código de segurança do cartão não foi informado") do
  $postPagamentoInvalido5 = @testeapi.postPagamentoInvalido(pagamento["CodigoDeSegurancaNaoInformado"].to_json)
end

Então("a API irá retornar a seguinte mensagem {string}") do |string|
  puts $postPagamentoInvalido5
  expect($postPagamentoInvalido5["errors"][0]["description"]).to eq(string)
end

Dado("que tenho um {string}") do |string|
end

Quando("realizar uma requisição para inserir um pagamento que já existe") do
  $pagamentoJaInserido = @testeapi.postPagamento("ORD-8UER09TTVWH1")
end

Então("a API responderá com o seguinte erro {string}") do |string|
  puts $pagamentoJaInserido
  expect($pagamentoJaInserido["errors"][0]["description"]).to eq(string)
end



