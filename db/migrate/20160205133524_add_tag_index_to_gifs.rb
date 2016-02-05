class AddTagIndexToGifs < ActiveRecord::Migration
  def change
    add_index  :gifs, :tags, using: 'gin'
  end
end
