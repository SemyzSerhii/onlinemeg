class PurchasesController < ApplicationController
  before_action :find_purchase, only: %i[show edit update destroy]

  def index
    @purchases = Purchase.all
  end

  def show

  end

  def create
    @purchase = Purchase.new.build(purchases_params)
  end

  def destroy

  end

  def edit;end

  def update

  end

  private
  def find_purchase
    @purchase  = Purchase.find(params[:id])
  end

  def purchases_params
    params.require(:purchase).permit(
      :title, :price, :short_description, :full_description, :in_stock
    )
  end
end

