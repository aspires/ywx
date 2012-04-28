# The main client object through which the Yahoo! Weather service may be accessed.
class YahooWeather::Client
  include HTTParty
  
  # the url with which we obtain weather information from yahoo
  @@API_URL = "http://weather.yahooapis.com/forecastrss"
  
  # Uncomment and fill in below section for hard embedded connection
  # @@APP_ID = "LIST_FREE_YAHOO_API_HERE"
  
  def initialize (app_id = @@APP_ID,api_url = @@API_URL)
    @api_url = api_url
    @app_id = app_id
  end

  # Returns a YahooWeather::Response object detailing the current weather
  # information for the specified location.
  #
  # The lookup requires the unique WOEID for the location whose
  # weather is sought.. To find your WOEID, browse or search for your
  # city from the Weather (http://weather.yahoo.com/) home page. The
  # WOEID is in the URL for the forecast page for that city. You can
  # also get the WOEID by entering your zip code on the home page. For
  # example, if you search for Los Angeles on the Weather home page,
  # the forecast page for that city is
  # http://weather.yahoo.com/united-states/california/los-angeles-2442047/. The
  # WOEID is 2442047.
  #
  # +units+ allows specifying whether to retrieve information in
  # +Fahrenheit+ as YahooWeather::Units::FAHRENHEIT, or +Celsius+ as
  # YahooWeather::Units::CELSIUS, and defaults to fahrenheit.
  #
  def lookup_by_woeid (woeid, units = 'f')
    url = @api_url + '?w=' + CGI.escape(woeid.to_s) + '&u=' + CGI.escape(units)
    _lookup(woeid, url)
  end

  # Returns a YahooWeather::Response object detailing the current weather
  # information for the specified location.
  #
  # +zip+ MUST BE A US ZIP CODE
  #
  # +units+ allows specifying whether to retrieve information in
  # +Fahrenheit+ as YahooWeather::Units::FAHRENHEIT, or +Celsius+ as
  # YahooWeather::Units::CELSIUS, and defaults to fahrenheit.
  #
  def lookup_zip(zip, units = 'f')
    woeid = woe_lookup(zip)
    lookup_by_woeid(woeid)
  end

  private

    def _lookup (src, url)
      begin
        response = Net::HTTP.get_response(URI.parse(url)).body.to_s

      rescue => e
        raise RuntimeError.new("failed to get weather [src=#{src}, " +
                               "url=#{url}, e=#{e}].")
      end

      # create the response object
      doc = Nokogiri::XML.parse(response)
      YahooWeather::Response.new(src, url, doc)
    end
    
    def woe_lookup(zip)
      p ydata = HTTParty.get("http://where.yahooapis.com/v1/places.q('#{zip}')?appid=[#{@app_id}]")
      woe_id = ydata["places"]["place"]["woeid"]
    end

end
