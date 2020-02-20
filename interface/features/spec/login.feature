#language: pt

Funcionalidade: Buscar Pedido
    

     @buscarPedido
    Cenario: Acesso
        Dado que sou um usuário logado
        Quando busco o id do pedido "ORD-5VUV321HVHO6"
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
            | "gbl_marcelino@hotmail.com" | "123" | "Usuário e/ou senha inválidos." |
            | "invalido#email"            | "123" | "Usuário e/ou senha inválidos." |
            | ""                          | "123" | "Usuário e/ou senha inválidos." |
            | "gbl_marcelino@hotmail.com" | ""    | "Usuário e/ou senha inválidos." |