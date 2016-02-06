class Gif < ActiveRecord::Base
  include Giphyable

  validates :uid, uniqueness: true

  def tags=(tags)
    if tags.kind_of? Array
      super(tags)
    else
      tags                = tags
      tags_without_spaces = tags.gsub(/\s+/, '')
      tags_array          = tags_without_spaces.scan(/[\w'-]+/)
      super(tags_array)
    end
  end
end
