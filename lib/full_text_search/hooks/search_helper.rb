module FullTextSearch
  module Hooks
    module SearchHelper
      include FullTextSearch::Hooks::SettingsHelper

      def search_result_entry_url(e, i)
        p "DEBUG: search_helper.rb:8"
        if fts_enable_tracking?
          search_parameters = {
            "search_id" => @search_request.search_id,
            "search_n" => i + @search_request.offset,
          }
        else
          search_parameters = {}
        end
        p ["DEBUG: search_helper.rb:16",search_parameters]
        x = e.event_url.merge(search_parameters)
        p ["DEBUG: search_helper.rb:18",x]
        x
      end
    end
  end
end
