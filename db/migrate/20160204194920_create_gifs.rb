class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :uid
      t.string :tags, array: true, default: []

      t.timestamps null: false
    end
  end
end
