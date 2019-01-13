class ProductsController < ApplicationController
  before_action :find_product, only: %i[show]

  def index
    @products = Products::Search.call(search_params).scope

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show; end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def search_params
    return {} unless params[:search]
    params.require(:search).permit(
      :category_id, :tag_id, :query
    )
  end

  def products_params
    params.require(:product).permit(
      :title, :price, :short_description, :full_description, :in_stock, :category_id, :all_tags
    )
  end
end

