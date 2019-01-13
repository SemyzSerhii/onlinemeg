class ProductsController < ApplicationController
  before_action :find_product, only: %i[show]

  def index
    @products =
      if params[:filters].present?
        Product.filter(category_id: params.dig(:filters, :category_id))
        Tagging.filter(tag_id: params.dig(:filters, :tag_id))
      else
        Product.all
      end

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

  def products_params
    params.require(:product).permit(
      :title, :price, :short_description, :full_description, :in_stock, :category_id, :all_tags
    )
  end
end

