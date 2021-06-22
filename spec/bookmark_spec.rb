require 'bookmark'

describe Bookmark do
    it 'returns an ai choice' do
      expect(Bookmark.all).to eq(["www.google.com", "www.bing.com", "www.ign.com"])
    end
end
