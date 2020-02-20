#language: pt

Funcionalidade: Buscar Pedido
    

    @buscarPedido
    Cenario: Acesso
        Dado que acesso a pagina de login
        Quando eu faço login com "gbl_marcelino@hotmail.com" e "gbl69gbl"
        Então devo ver o logo da wirecard
        Então devo clicar em pedidos
        Então devo inserir o codigo "ORD-5VUV321HVHO6" do pedido
        Então devo cliclar em buscar
        Então devo verificar se o pedido é "123abc"
        Então devo verificar se valor total é "R$73,00"
        Então devo verificar se comprador é "João Silva"

    @loginFail
    Esquema do Cenario: Login sem sucesso
        Dado que acesso a pagina de login
        Quando eu faço login com <email> e <senha>
        Então devo ver a mensagem de alerta <mensagem>

        Exemplos:
            | email                       | senha | mensagem                        |
            | "gbl_marcelino@hotmail.com" | "123" | "Usuário e/ou senha inválidos. Você é um robô?" |
            | "invalido#email"            | "123" | "Usuário e/ou senha inválidos. Você é um robô?" |
            | ""                          | "123" | "Usuário e/ou senha inválidos. Você é um robô?" |
            | "gbl_marcelino@hotmail.com" | ""    | "Usuário e/ou senha inválidos. Você é um robô?" |