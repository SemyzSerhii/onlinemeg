module Products
  class Search
    include Interactor
    def call
      context.scope = Product.all
      context.scope.filter_by_category(category_id: context.category_id) if context.category_id
      context.scope.filter_by_tag(tag_id: context.tag_id) if context.tag_id
      context.scope.full_search(context.query) if context.query
    end
  end
end