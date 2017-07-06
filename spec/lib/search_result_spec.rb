require 'rails_helper'
require 'search_result'
require 'test_result'
include TestData

RSpec.describe 'SearchResult' do
  before(:each) do
    SearchResult.store_search_result(GEM_RESULT)
  end

  describe 'return_result' do
    it 'returns stored a search_result' do
      expect(SearchResult.return_result).to eq(GEM_RESULT)
    end
  end

  describe 'result_created?' do
    it 'returns false if a search_result has not been stored' do
      SearchResult.store_search_result(nil)
      expect(SearchResult.result_created?).to eq(false)
    end

    it 'returns true if a search_result has been stored' do
      expect(SearchResult.result_created?).to eq(true)
    end
  end

  describe 'title' do
    it 'returns the search_result title' do
      expect(SearchResult.title).to eq(GEM_RESULT['name'])
    end
  end

  describe 'info' do
    it 'returns search_result info' do
      expect(SearchResult.info).to eq(GEM_RESULT['info'])
    end
  end

  describe 'deps' do
    it 'returns each search_result dependencies' do
      first_dep_name = GEM_RESULT['dependencies']['development'][0]['name']
      expect(SearchResult.deps.first).to eq(first_dep_name)
    end
  end

  describe 'result_error?' do
    it 'returns true if error_message exists within search_result' do
      ERROR_MESSAGE = { 'error_message' =>
                        "Oh no! Looks like that gem can't be found." }
      SearchResult.store_search_result(ERROR_MESSAGE)
      expect(SearchResult.result_error?).to eq(true)
    end

    it 'returns false if error_message does not exist within search_result' do
      expect(SearchResult.result_error?).to eq(false)
    end
  end
end
