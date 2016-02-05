# Abstract core (base) class for Giphy API.
# Provides foundation parts for API endpoints
#
# @author Artyom Pertsovsky
#

module Giphy
  class Core
    BASE_URL = 'http://api.giphy.com'
    VERSION = 'v1'

    def initialize
      @url    = construct_url
      @params = blank_params
    end

    protected

    def construct_url
      "#{BASE_URL}/#{VERSION}"
    end

    def blank_params
      {}
    end
  end
end
