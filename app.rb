require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "json"

exchange_rates_api_key = ENV.fetch("EXCHANGE_RATE_KEY")
exchange_rates_url = "https://api.exchangerate.host/list?access_key=" + exchange_rates_api_key
raw_response = HTTP.get(exchange_rates_url)
parsed_response = JSON.parse(raw_response)

get("/") do
  erb(:first_currency)
end
