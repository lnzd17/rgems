# processes search result from 'Gems' api call
class SearchResult
  attr_reader :search_result

  def self.store_search_result(search_result)
    @search_result = search_result
  end

  def self.return_result
    @search_result
  end

  def self.result_created?
    @search_result.nil? ? false : true
  end

  def self.title
    @search_result['name'] if result_created?
  end

  def self.gem_url(gem_name)
    Gems.info(gem_name)['project_uri']
  end

  def self.info
    @search_result['info'] if result_created?
  end

  def self.deps
    if result_created?
      @search_result['dependencies']['development'].map { |d| d['name'] }
    end
  end

  def self.result_error?
    if result_created?
      @search_result.key?('error_message') ? true : false
    end
  end
end
