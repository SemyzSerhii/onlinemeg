class LineItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product)

    respond_to do |format|
      if @line_item.save
        format.html {redirect_to @line_item.cart, notice: 'Товар добавлено' }
        format.json { render action: 'show', status: :created, location: @line_item }
      end
    end
  end
end
