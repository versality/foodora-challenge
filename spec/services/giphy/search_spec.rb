require 'spec_helper'

describe Giphy::Search do
  describe '#by_title', :vcr do
    let(:query) { 'lol' }
    let(:giphy_search) { Giphy::Search.new }

    context 'given correct arguments' do
      it 'returns valid body with content' do
        gifs = giphy_search.by_title(query)
        expect(gifs).not_to be_nil
      end
    end

    context 'given incorrect arguments type' do
      it 'should raise Giphy::InvalidSearchArgs exception' do
        expect { giphy_search.by_title([1, 2, 3]) }.to raise_error(Giphy::InvalidSearchArgs)
      end
    end
  end
end