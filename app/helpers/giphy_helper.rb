module GiphyHelper
  def giphy_fixed_height_image(gif)
    image_tag(gif['images']['fixed_height']['url'])
  end
end
