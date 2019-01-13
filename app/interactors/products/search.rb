module Products
  class Search
    include Interactor
    def call
      context.scope = Product
      full_scope unless filters_any?
      search_by_category if context.category_id
      search_by_tag if context.tag_id
      serach_by_fields if context.query
    end

    private

    def serach_by_fields
      context.scope = context.scope.full_search(context.query)
    end

    def search_by_category
      context.scope = context.scope = context.scope.filter_by_category(category_id: context.category_id)
    end

    def search_by_tag
      context.scope = context.scope.filter_by_tag(tag_id: context.tag_id)
    end

    def filters_any?
      context.category_id || context.tag_id || context.query
    end

    def full_scope
      context.scope = context.scope.all
    end
  end
end