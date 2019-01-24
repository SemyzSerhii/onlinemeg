class ApplicationController < ActionController::Base
  before_action :set_cart

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])
    return if @cart

    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
