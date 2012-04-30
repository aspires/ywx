# yahoo-weather -- provides OO access to the Yahoo! Weather RSS XML feed
# Copyright (C) 2006 - 2009 Walter Korman <shaper@fatgoose.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require 'net/http'
require 'cgi'
require 'time'
require 'nokogiri'
require "httparty"

class YahooWeather
  VERSION = '0.1.2'

  def self._parse_time (text)
    (text) ? Time.parse(text) : nil
  end
end

require_relative 'yahoo-weather/astronomy'
require_relative 'yahoo-weather/atmosphere'
require_relative 'yahoo-weather/client'
require_relative 'yahoo-weather/condition'
require_relative 'yahoo-weather/forecast'
require_relative 'yahoo-weather/image'
require_relative 'yahoo-weather/location'
require_relative 'yahoo-weather/response'
require_relative 'yahoo-weather/units'
require_relative 'yahoo-weather/wind'