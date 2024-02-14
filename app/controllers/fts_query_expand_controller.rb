class FtsQueryExpandController < ApplicationController
  def index
    p "DEBUG: fts_query_expand_controller.rb:3"
    @request = FullTextSearch::QueryExpansionRequest.new(request_params)
    p "DEBUG: fts_query_expand_controller.rb:5"
    @expanded = FtsQueryExpansion.expand_query(@request.query)
    p "DEBUG: fts_query_expand_controller.rb:7"
    render layout: false if request.xhr?
  end

  private
  def request_params
    params.permit(:query)
  end
end
