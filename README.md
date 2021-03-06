# Objetivo
Esse projeto tem como principal objetivo a avaliação do processo seletivo da Wirecard para a vaga de Analista de Testes / Qualidade de software.
Os testes automatizados foram escritos utilizando o Cucumber, facilitando o entendimento dos cenários abordados na automação.

# Tecnologias utilizadas
- [Ruby](https://www.ruby-lang.org/pt/)
- [Cucumber](https://cucumber.io/)
- [Capybara](https://www.rubydoc.info/github/jnicklas/capybara)
- [HTTParty](https://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods)
- [Chromedriver](https://chromedriver.chromium.org/downloads)

# Funcionalidades
- Automação de testes dos Endpoints de(pedidos e pagamentos) da API da Wirecard
- Automação de testes de interface do ambiente de testes referente à pedidos

# Como executar os testes da API
Para executar os testes da API deve-se possuir instalado o **Ruby**, **Bundle**, clonar o projeto e executar os seguintes comandos dentro da pasta "api/"
- *bundle install*
- *cucumber -t @pedido* (para executar os testes referente aos endpoints de pedidos)
- *cucumber -t @pagamento* (para executar os testes referente aos endpoints de pagamentos)
- *cucumber* (para executar testes tanto de pedidos, quanto de pagamentos)

**_Observações: A execução dos testes gera um relatório de report em HTML dentro de api/log. Facilita na visualização dos cenários executados, e se deram certo (verde) ou falharam (vermelho)._**

# ChromeDriver
- Para rodar os testes de interface, é necessário possuir o ChromeDriver.
- Verifique a versão do chrome [aqui](https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
- Baixe a versão do ChromeDriver compatível com o seu navegador [aqui](https://chromedriver.storage.googleapis.com/index.html)
- Por fim, mova o ChromeDriver para o diretório correto:
- *sudo mv chromedriver /usr/local/bin* 

# Como executar os testes de Interface

Para executar os testes de Interface deve-se possuir instalado o **Ruby**, **Bundle**, **ChromeDriver**, clonar o projeto e executar os seguintes comandos dentro da pasta "interface/"
- *bundle install*
- *cucumber -t @buscarpedido* (para executar os testes referente a busca de pedidos)
- *cucumber -t @loginFail* (para executar os testes referente as falhas de login) (recomendo rodar por ultimo por conta do problema comentado nas observações)
- *cucumber* (para executar testes referente a busca de pedido, e falhas no login)

*Observações: Alguns empecilhos quanto ao teste de interface, por conta da inconstância dos **alerts** da aplicação. Outro problema quanto
ao login, por conta da validação de **robô** quando é realizado multiplas tentativas de login. Por conta disso, pode acontecer
falhas na execução dos testes*

# Erros da **aplicação web**
Realizando alguns testes manuais na [aplicação web](https://conta-sandbox.wirecard.com.br/) foram encontrados os seguintes problemas:
- A busca de pedidos funciona apenas quando é realizado a busca pelo **ID**, os demais filtros(sem esse parâmetro) não funcionam, tanto em conjunto, quanto isoladamente
- A opção **Ver Todos** também não é funcional
- Módulo **Financeiro** não exibe nenhum lançamento

# Sugestões de melhorias
- Ajustar a busca para que seja possível buscar um pedido pelo **OwnId**, atualmente apenas a busca pelo **Id** retorna o resultado
- Alguns elementos HTML da aplicação Web não possuem Id, ou possuem Ids na pagina repetidos, ou o nome do Id não é intuitivo, como por
exemplo o **input** da busca de pedidos, cujo id é apenas a letra **"q"**, isso dificulta na criação de testes automatizados para interface
![Screenshot_20200220_044730](https://user-images.githubusercontent.com/32210024/74916424-36589500-539c-11ea-93b9-d93b490a7ac9.png)



