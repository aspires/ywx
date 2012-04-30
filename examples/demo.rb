require_relative "lib/ywx.rb"
require "pp"

#Get your API key here(http://developer.yahoo.com/)
#Its free and easy

appid = 'INSERT_YAHOO_APP_ID_HERE'

@client = YahooWeather::Client.new(appid)

response = @client.lookup_zip(73072)

pp response
puts
pp response.atmosphere
