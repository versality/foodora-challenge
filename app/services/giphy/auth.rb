require_relative 'core'

module Giphy
  class Auth < Giphy::Core
    def initialize
      super()

      authenticate
    end

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
