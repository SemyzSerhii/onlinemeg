class LineItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product)

      if @line_item.save
        respond_to :js
      end
  end
end
