require 'rails_helper'
require 'search_result'
require 'gem_result'

RSpec.describe 'SearchResult' do
  describe 'return_result' do
    it 'returns stored a search_result' do
      SearchResult.store_search_result(@gem_result)
      expect(SearchResult.return_result).to eq(@gem_result);
    end
  end

  describe 'result_created?' do
    it 'confirms if a search_result has been stored'
  end

  describe 'title' do
    it 'returns the search_result title'
  end

  describe 'info' do
    it 'returns search_result info'
  end

  describe 'deps' do
    it 'returns each search_result dependencies'
  end

  describe 'result_error?' do
    it 'confirms if error_message exists within search_result'
  end
end
