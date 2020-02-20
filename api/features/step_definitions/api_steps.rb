require 'json'
filePedido = File.read(File.join(Dir.pwd, "features/support/fixtures/pedido.json"))
jsonFile = JSON.parse(filePedido.force_encoding("UTF-8"))
pedido = ''

filePagamento = File.read(File.join(Dir.pwd, "features/support/fixtures/pagamento.json"))
jsonFilePag = JSON.parse(filePagamento.force_encoding("UTF-8"))
pagamento = ''

Dado("que tenho o pedido {string}") do |codigo|
  pedido = jsonFile["#{codigo}"]
end

Quando("realizar uma requisição para inserir um pedido") do
  $response = @testeapi.postPedido(pedido.to_json)
end

Então("a API irá retornar a seguinte mensagem de erro {string}") do |string|
  expect($response["errors"][0]["description"]).to eq(string)
end


Então("a API irá retornar os dados do cadastro do pedido respondendo o código {int}") do |int|
  expect($response.code).to eq(int)
  expect($response.message).to eq("Created")
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

Dado("o endereço da API para consultar um Pagamento") do
end

Quando("realizar uma requisição passando o ID do Pagamento") do
  $getPagamento = @testeapi.getPagamento($responsePagamento["id"])
end

Então("a API irá retornar os dados do pagamento correspondente constando o código {int}") do |statusGetPagamento|
  puts "Pagamento ID: #{$getPagamento["ID"]}"
  expect($getPagamento.code).to eq(statusGetPagamento)
  puts "Pagamento GetMessage: #{$getPagamento.message}"
  puts "Pagamento code: #{$getPagamento.code}"
end

Dado("que tenho um pedido cadastrado") do
  pedido = jsonFile["pedidoCompleto"]
  $response = @testeapi.postPedido(pedido.to_json)
end

Dado("os dados de pagamento {string}") do |codigo|
  pagamento = jsonFilePag["#{codigo}"]
end

Quando("realizar uma requisição para cadastrar um pagamento") do
  $responsePagamento = @testeapi.postPagamento($response["id"], pagamento.to_json)
end

Então("a API responderá a mensagem {string}") do |string|
  expect($responsePagamento["errors"][0]["description"]).to eql(string)
end

Então("a API irá retornar os dados do pagamento correspondente respondendo o código {int}") do |int|
  expect($responsePagamento.code).to eql (int)
end


Dado("que tenho um pedido com pagamento já inserido {string}") do |string|
  $pagamentoInserido = "#{string}"
end

Quando("realizar uma requisição para inserir um pagamento que já existe") do
  $responsePagamentoInserido = @testeapi.postPagamento($pagamentoInserido, pagamento.to_json)
end

Então("a API responderá com o seguinte erro {string}") do |string|
  puts $responsePagamentoInserido
end