module Giphyable
  extend ActiveSupport::Concern

  IMAGE_URL = 'http://media2.giphy.com/media'

  def giphy_image_url
    "#{IMAGE_URL}/#{self.uid}/200.gif"
  end
end