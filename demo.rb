require_relative "lib/yahoo-weather.rb"

@client = YahooWeather::Client.new('LM816I7V34HgjIFkSrFhatjTI6G1ksJFWwOTVOVOpSssTUFnpRI9iNIijbuQPOaOFR_Y_EmFbPXk03XF45uLqchthxBXWuw')

response = @client.lookup_zip(72072)

p response