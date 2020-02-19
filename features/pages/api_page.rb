class Api
  include HTTParty
  require_relative "../hooks/api_hook"
  base_uri "https://sandbox.moip.com.br/v2"

  def initialize(pedidoCompleto, pagamentoCompleto)
    self.class.headers "Content-Type" => "application/json"
    self.class.headers "Authorization" => "Basic RkNaUkJFTTdIQ1BUVDZVUVE4WEhVOVhUM1k5QzhUQ0k6SEFMREdXVUJHWFVSQzdVODY1U0tZUjdMWlROSE1JUFpNRDdLTVlRQQ=="
    self.class.headers "username" => "FCZRBEM7HCPTT6UQQ8XHU9XT3Y9C8TCI"
    self.class.headers "password" => "HALDGWUBGXURC7U865SKYR7LZTNHMIPZMD7KMYQA"
    @pedidoCompleto = { :body => pedidoCompleto }
    @pagamentoCompleto = { :body => pagamentoCompleto }
  end

  def postPedidoCompleto
    self.class.post("/orders",@pedidoCompleto)
  end

  def postPedidoParaErros(pedido)
    self.class.post("/orders",body: pedido)
  end

  def getPedido(id)
    self.class.get("/orders/#{id}")
  end

  def postPagamento(id)
    self.class.post("/orders/#{id}/payments", @pagamentoCompleto)
  end

  def postPagamentoInvalido(pagamento)
    self.class.post("/orders/ORD-0KQ325R0O0VG/payments", body: pagamento)
  end

  def getPagamento(id)
    self.class.get("/payments/#{id}")
  end

end
