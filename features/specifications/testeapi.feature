#language: pt
@testeapi
Funcionalidade: Testar diversos cenarios da API para Pedidos e Pagamentos
    Como um usuário do sistema
    Eu quero realizar as requisições na API
    Afim de manipular e validar as informações referente a pedidos e pagamentos

Cenário: Cadastrar um Pedido
    Dado o endereço da API para manter o cadastro de um pedido
    Quando realizar uma requisição para cadastrar um pedido
    Então a API irá retornar os dados do cadastro do pedido respondendo o código 201

Cenário: Consultar um Pedido
    Dado o endereço da API para retornar um pedido
    Quando realizar uma requisição passando o ID do pedido
    Então a API irá retornar os dados do pedido correspondente respondendo o código 200
 
Cenário: Cadastrar um Pagamento
    Dado o endereço da API para cadastrar um Pagamento
    Quando realizar uma requisição passando o ID do Pedido
    Então a API irá retornar os dados do pagamento correspondente respondendo o código 201

Cenário: Consultar um Pagamento
    Dado o endereço da API para consultar um Pagamento
    Quando realizar uma requisição passando o ID do Pagamento
    Então a API irá retornar os dados do pagamento correspondente constando o código 200

Cenário: Validar pedido sem o parâmetro OwnId
    Dado que tenho o pedido sem o parâmetro "OwnId"
    Quando realizar uma requisição para inserir um pedido sem o parâmetro OwnId
    Então a API irá retornar a seguinte mensagem de erro "É necessario informar seu identificador próprio"

Cenário: Validar pedido com parâmetro OwnId com mais de 45 caracteres
    Dado que tenho o pedido com OwnId "mais que 45 caracteres"
    Quando realizar uma requisição para inserir um pedido com mais de 45 caracteres
    Então a API irá retornar a mensagem de erro "O identificador próprio de pedido deve ter no máximo 45 caracteres"

Cenário: Validar pedido sem Item
    Dado que tenho o pedido "sem item"
    Quando realizar uma requisição para inserir um pedido sem item
    Então a API retornará a mensagem de erro "É necessario informar pelo menos um item."

Cenário: Validar pedido sem nome do produto
    Dado que tenho um pedido "sem nome do produto"
    Quando realizar uma requisição para inserir um pedido sem nome do produto
    Então a API retornará a seguinte mensagem de erro "Informe o nome do produto"

Cenário: Validar pedido sem valor no item
    Dado que tenho o pedido em que "não há valor no item"
    Quando realizar uma requisição para inserir um pedido com o item sem valor
    Então a API responderá com a seguinte mensagem de erro "O item deve ter um valor"

Cenário: Validar pagamento com data de nascimento do portador do cartão inválida
    Dado que tenho o pagamento em que "a data de nascimento do portador do cartão é inválida"
    Quando realizar uma requisição para inserir um pagamento em que a data do portador do cartão é inválida
    Então a API responderá a seguinte mensagem de erro "A data de nascimento do portador do cartão é inválido"

Cenário: Validar pagamento com CPF fora do padrão de 11 digitos
    Dado que tenho o pagamento com o "CPF fora do padrão de 11 digitos"
    Quando realizar uma requisição para inserir um pagamento o CPF não possui 11 digitos
    Então a API retornara o erro "O CPF informado deve ter 11 números"

Cenário: Validar pagamento com numero de cartao invalido
    Dado que tenho um pagamento com um "Numero de cartão inválido"
    Quando realizar uma requisição para inserir um pagamento em que o número de cartão é inválido
    Então a API deverá retornar o erro "O número informado não é um número de cartão válido"

Cenário: Validar pagamento com data de expiração do cartão de crédito inferior a data atual
    Dado que tenho um pagamento com uma "Data de expiração do cartão de crédito inferior a data atual"
    Quando realizar uma requisição para inserir um pagamento em a data de expiração do cartão de crédito é inválida
    Então a API deverá retornar a mensagem de erro "A data de expiração do cartão de crédito deve ser maior ou igual a data atual"

Cenário: Validar pagamento com código de segurança do cartão não informado
    Dado que tenho um pagamento em que o "código de segurança do cartão não foi informado"
    Quando realizar uma requisição para inserir um pagamento em o código de segurança do cartão não foi informado
    Então a API irá retornar a seguinte mensagem "O código de segurança do cartão não foi informado"

Cenário: Validar pagamento já inserido para o pedido relacionado
    Dado que tenho um "pagamento já inserido"
    Quando realizar uma requisição para inserir um pagamento que já existe
    Então a API responderá com o seguinte erro "O pedido já foi pago"

