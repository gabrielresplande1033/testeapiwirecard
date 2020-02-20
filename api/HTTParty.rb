require 'httparty'
auth = {:username => "FCZRBEM7HCPTT6UQQ8XHU9XT3Y9C8TCI", password: "HALDGWUBGXURC7U865SKYR7LZTNHMIPZMD7KMYQA"}
response = HTTParty.get("https://sandbox.moip.com.br/v2/orders", headers: {"Authorization" => "Token token=\"RkNaUkJFTTdIQ1BUVDZVUVE4WEhVOVhUM1k5QzhUQ0k6SEFMREdXVUJHWFVSQzdVODY1U0tZUjdMWlROSE1JUFpNRDdLTVlRQQ==\""},
:basic_auth=>auth)
    puts "response code :#{response.code}"
    puts "response message :#{response.message}"
    puts "response headers: #{response.headers}"
    puts "response body: #{response.body}"