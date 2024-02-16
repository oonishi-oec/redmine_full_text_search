module FullTextSearch
  class KbArticleMapper < Mapper
    class << self
      def redmine_mapper_class
        RedmineKbArticleMapper
      end

      def fts_mapper_class
        FtsKbArticleMapper
      end
    end
  end
  resolver.register(KbArticle, KbArticleMapper)

  class RedmineKbArticleMapper < RedmineMapper
    def upsert_fts_target(options={})
      fts_target = find_fts_target
      fts_target.source_id = @record.id
      fts_target.source_type_id = Type[@record.class].id
      fts_target.project_id = @record.project_id
      fts_target.title = @record.title
      fts_target.content = @record.content
      fts_target.last_modified_at = @record.updated_at
      fts_target.registered_at = @record.created_at
      fts_target.save!
    end
  end

  class FtsKbArticleMapper < FtsMapper
    def title_prefix
      ""
    end

    def url
      {
        #controller: "documents",
        controller: "articles",
        project: @record.project.identifier,
        action: "show",
        id: @record.source_id,
      }
    end
  end
end
