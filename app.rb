require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "json"
require "http"

exchange_rates_api_key = ENV.fetch("EXCHANGE_RATE_KEY")

get("/") do
  exchange_rates_url_list = "https://api.exchangerate.host/list?access_key=" + exchange_rates_api_key
  raw_response_list = HTTP.get(exchange_rates_url_list).to_s
  parsed_response_list = JSON.parse(raw_response_list)
  
  @list = parsed_response_list.fetch("currencies")
  erb(:list)
end

get("/:first_currency") do
  exchange_rates_url_list = "https://api.exchangerate.host/list?access_key=" + exchange_rates_api_key
  raw_response_list = HTTP.get(exchange_rates_url_list).to_s
  parsed_response_list = JSON.parse(raw_response_list)

  first_currency = params.fetch("first_currency")

  @first_currency = first_currency

  @list = parsed_response_list.fetch("currencies")

  erb(:convert)
end

get("/:first_currency/:second_currency") do
  first_currency = params.fetch("first_currency")
  second_currency = params.fetch("second_currency")

  
  exchange_rates_url_convert = "https://api.exchangerate.host/convert?from=" + first_currency + "&to=" + second_currency + "&amount=1&access_key=" + exchange_rates_api_key
  
  raw_response_convert = HTTP.get(exchange_rates_url_convert).to_s
  parsed_response_convert = JSON.parse(raw_response_convert)
  
  @first_currency = first_currency
  @second_currency = second_currency
  
  @result = parsed_response_convert.fetch("result")

  erb(:result)
end
