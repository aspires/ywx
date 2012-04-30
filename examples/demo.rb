require_relative "../lib/ywx.rb"
require "pp"

#Get your API key here(http://developer.yahoo.com/)
#Its free and easy

key = 'INSERT_YAHOO_DEV_KEY_HERE'

@client = YahooWeather::Client.new(key)

response = @client.lookup_zip(73072)

pp response
puts
pp response.atmosphere
