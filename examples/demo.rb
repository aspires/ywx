require_relative "lib/yahoo-weather.rb"
require "pp"

@client = YahooWeather::Client.new('LM816I7V34HgjIFkSrFhatjTI6G1ksJFWwOTVOVOpSssTUFnpRI9iNIijbuQPOaOFR_Y_EmFbPXk03XF45uLqchthxBXWuw')

response = @client.lookup_zip(73072)

pp response
puts
pp response.atmosphere
