require_relative 'core'

# Abstract auth class for Giphy API.
# Provides essential mechanism for authenticating with endpoints
#

module Giphy
  class Auth < Giphy::Core
    def initialize
      super()

      authenticate
    end

    # Main method responsible for merging auth credentials into @params further usage
    def authenticate
      @params.merge!(credentials)
    end

    private
    def credentials
      {
          api_key: ENV['GIPHY_API_KEY']
      }
    end
  end
end
