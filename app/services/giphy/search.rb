require_relative 'auth'
require_relative 'validation'
require 'json'
require 'net/http'

# Search end-chain class providing search mechanism
#

module Giphy
  class Search < Giphy::Auth
    include Giphy::Validation

    ENDPOINT = 'gifs/search'

    def initialize
      super()

      construct_endpoint
    end

    # Allows searching gifs by title
    #
    # @param [String] title query string for fetching gifs
    # @return [Hash] with gifs as per https://github.com/Giphy/GiphyAPI#sample-response-search
    def by_title(title)
      validate_by_title_args(title)

      query = {q: title}
      @params.merge!(query)

      perform_request
    end

    private

    def construct_endpoint
      @url = "#{@url}/#{ENDPOINT}"
    end

    def perform_request
      url       = @url
      uri       = URI(url)
      uri.query = URI.encode_www_form(@params)
      res       = Net::HTTP.get_response(uri)

      response_body = JSON.parse(res.body)

      if response_body['meta']['status'] == 200
        response_body['data']
      else
        false
      end
    end
  end
end
