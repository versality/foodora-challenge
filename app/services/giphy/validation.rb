class InvalidSearchArgs < StandardError; end

module Giphy
  module Validation
    def validate_by_title_args(title)
      unless title.is_a? String
        raise InvalidSearchArgs, 'title must be a string.'
      end
    end
  end
end