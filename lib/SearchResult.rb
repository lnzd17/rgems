class SearchResult
  attr_accessor :search_result

  def self.store_search_result(search_result)
    @search_result = search_result
  end

  def self.return_result
    @search_result
  end

  def self.obj_created?
    @search_result.nil? ? false : true
  end

  def self.title
     @search_result['name'] if obj_created?
  end

  def self.info
     @search_result['info'] if obj_created?
  end

  def self.deps
    if obj_created?
      @search_result['dependencies']['development'].map{|d| d['name']}
    end
  end

  def self.result_error?
    if obj_created?
      @search_result.has_key?('error_message') ? true : false
    end
  end
end
