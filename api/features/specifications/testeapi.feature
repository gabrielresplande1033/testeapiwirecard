#language: pt
@testeapi
Funcionalidade: Testar diversos cenarios da API para Pedidos e Pagamentos
    Como um usuário do sistema
    Eu quero realizar as requisições na API
    Afim de manipular e validar as informações referente a pedidos e pagamentos

@pedido
Cenário: Cadastrar um Pedido
    Dado que tenho o pedido "pedidoCompleto"
    Quando realizar uma requisição para inserir um pedido
    Então a API irá retornar os dados do cadastro do pedido respondendo o código 201

@pedido
Cenário: Consultar um Pedido
    Dado o endereço da API para retornar um pedido
    Quando realizar uma requisição passando o ID do pedido
    Então a API irá retornar os dados do pedido correspondente respondendo o código 200
    
@pedido
Cenário: Validar pedido sem o parâmetro OwnId
    Dado que tenho o pedido "SemOwnId"
    Quando realizar uma requisição para inserir um pedido
    Então a API irá retornar a seguinte mensagem de erro "É necessario informar seu identificador próprio"
@pedido
Cenário: Validar pedido com parâmetro OwnId com mais de 45 caracteres
    Dado que tenho o pedido "ComOwnIdMaisQue45Caracteres"
    Quando realizar uma requisição para inserir um pedido
    Então a API irá retornar a seguinte mensagem de erro "O identificador próprio de pedido deve ter no máximo 45 caracteres"

@pedido
Cenário: Validar pedido sem Item
    Dado que tenho o pedido "SemItem"
    Quando realizar uma requisição para inserir um pedido
    Então a API irá retornar a seguinte mensagem de erro "É necessario informar pelo menos um item."

@pedido
Cenário: Validar pedido sem nome do produto
    Dado que tenho o pedido "SemNomeDoProduto"
    Quando realizar uma requisição para inserir um pedido
    Então a API irá retornar a seguinte mensagem de erro "Informe o nome do produto"

@pedido
Cenário: Validar pedido sem valor no item
    Dado que tenho o pedido "SemValorNoItem"
    Quando realizar uma requisição para inserir um pedido
    Então a API irá retornar a seguinte mensagem de erro "O item deve ter um valor"

@pagamento     
Cenário: Cadastrar um Pagamento
    Dado que tenho um pedido cadastrado
    E os dados de pagamento "PagamentoCompleto"
    Quando realizar uma requisição para cadastrar um pagamento
    Então a API irá retornar os dados do pagamento correspondente respondendo o código 201

@pagamento
Cenário: Consultar um Pagamento
    Dado o endereço da API para consultar um Pagamento
    Quando realizar uma requisição passando o ID do Pagamento
    Então a API irá retornar os dados do pagamento correspondente constando o código 200

@pagamento
Cenário: Validar pagamento com data de nascimento do portador do cartão inválida
    Dado que tenho um pedido cadastrado
    E os dados de pagamento "DataNascimentoPortadorInvalida"
    Quando realizar uma requisição para cadastrar um pagamento
    Então a API responderá a mensagem "A data de nascimento do portador do cartão é inválido"

@pagamento
Cenário: Validar pagamento com CPF fora do padrão de 11 digitos
    Dado que tenho um pedido cadastrado
    E os dados de pagamento "CPFInvalido"
    Quando realizar uma requisição para cadastrar um pagamento
    Então a API responderá a mensagem "O CPF informado deve ter 11 números"

@pagamento
Cenário: Validar pagamento com numero de cartao invalido
    Dado que tenho um pedido cadastrado
    E os dados de pagamento "NumeroDeCartaoInvalido"
    Quando realizar uma requisição para cadastrar um pagamento
    Então a API responderá a mensagem "O número informado não é um número de cartão válido"

@pagamento
Cenário: Validar pagamento com data de expiração do cartão de crédito inferior a data atual
    Dado que tenho um pedido cadastrado
    E os dados de pagamento "DataDeExpiracaoInvalida"
    Quando realizar uma requisição para cadastrar um pagamento
    Então a API responderá a mensagem "A data de expiração do cartão de crédito deve ser maior ou igual a data atual"

@pagamento
Cenário: Validar pagamento com código de segurança do cartão não informado
    Dado que tenho um pedido cadastrado
    E os dados de pagamento "CodigoDeSegurancaNaoInformado"
    Quando realizar uma requisição para cadastrar um pagamento
    Então a API responderá a mensagem "O código de segurança do cartão não foi informado"

@pagamento
Cenário: Validar pagamento já inserido para o pedido relacionado
    Dado que tenho um pedido com pagamento já inserido "ORD-7B1RMJGPPRUR"
    E os dados de pagamento "PagamentoCompleto"
    Quando realizar uma requisição para inserir um pagamento que já existe
    Então a API responderá com o seguinte erro "O pedido já foi pago"

