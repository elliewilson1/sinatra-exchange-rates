require "sinatra"
require "sinatra/reloader"
require "dotenv/load"

get("/") do
  "
  <h1>Currency pairs</h1>
  "
end



pp ENV.fetch("EXCHANGE_RATE_KEY")
