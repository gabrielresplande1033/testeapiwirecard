class LoginPage
    include Capybara::DSL

    def go
        visit '/login'
    end

    def logar(login, password)
        find('input[name=login]').set login

        find('input[name=password').set password

        click_button 'Acessar sua conta'
        click_on(class: 'close')

       
    end

    def clicarPedido
        find('#tour-pedidos').click
    end

    def inserirCodigo(codigo)
        sleep 3
        click_on(class: 'joyride-close-tip')
        find("input[placeholder='Buscar por pedido ou comprador']").set codigo
    end

    def clickBuscar
        click_link 'Buscar'
    end

    def robo
        check = find('#rc-anchor-container div.recaptcha-checkbox-border')
        if check.visible?
            check.click
        end
    end
    

    def alert
        find('#login div.mg-alert-strip').text
    end
end
