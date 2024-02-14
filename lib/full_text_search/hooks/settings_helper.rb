module FullTextSearch
  module Hooks
    module SettingsHelper
      def fts_display_score?
        p "DEBUG: settings_helper.rb:5"
        Setting.plugin_full_text_search.display_score?
      end

      def fts_display_similar_issues?
        p "DEBUG: settings_helper.rb:9"
        Setting.plugin_full_text_search.display_similar_issues?
      end

      def fts_enable_tracking?
        p "DEBUG: settings_helper.rb:14"
        Setting.plugin_full_text_search.enable_tracking?
      end
    end
  end
end
