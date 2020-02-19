Before "@testeapi" do
  @nome = Faker::Company.name

  pedidoCompleto = {
    "ownId": @nome,
    "items": [
      {
        "product": "Box de Seriado - Exterminate!",
        "quantity": 1,
        "detail": "Box de seriado com 8 dvds",
        "price": 7300,
      },
    ],
    "customer": {
      "ownId": "cliente_xyz",
      "fullname": "João Silva",
      "email": "joaosilva@email.com",
    },
  }

  pagamentoCompleto = { 
    "installmentCount":2,
    "fundingInstrument":{ 
       "method":"CREDIT_CARD",
       "creditCard":{ 
          "expirationMonth":12,
          "expirationYear":25,
          "number":"5555666677778884",
          "cvc":"123",
          "holder":{ 
             "fullname":"João Portador da Silva",
             "birthdate":"1988-12-30",
             "taxDocument":{ 
                "type":"CPF",
                "number":"12345679891"
             },
             "phone":{ 
                "countryCode":"55",
                "areaCode":"11",
                "number":"66778899"
             }
          }
       }
    }
 }

  @pedidoCompleto = pedidoCompleto.to_json
  @pagamentoCompleto = pagamentoCompleto.to_json
  
  @testeapi = Api.new(@pedidoCompleto, @pagamentoCompleto)
end

