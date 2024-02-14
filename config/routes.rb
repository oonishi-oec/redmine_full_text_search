scope :full_text_search do
  resources :fts_query_expansions, path: "query_expansions"
  get "query_expand",
      to: "fts_query_expand#index",
      as: :fts_query_expand

  scope '../projects' do
    scope ':project' do
      scope "knowledgebase" do
        resources :articles
      end
    end
  end
  # scope "knowledgebase" do
  #   resources :articles
  # end

end
