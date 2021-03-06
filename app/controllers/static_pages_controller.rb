class StaticPagesController < ApplicationController
  require 'search_result'

  def root
    @search_result = SearchResult.return_result

    if SearchResult.result_error?
      @result_error = @search_result['error_message']
    else
      @title = SearchResult.title
      @info = SearchResult.info
      @deps = SearchResult.deps
    end
  end

  def search
    query = params[:query].gsub(/[[:space:]]/, '')
    begin
      api_call = Gems.info(query)
    rescue JSON::ParserError
      api_call = { 'error_message' =>
                   "Oh no! Looks like that gem can't be found." }
    end

    SearchResult.store_search_result(api_call, query)

    redirect_to root_path
  end

  def favorites; end
end
