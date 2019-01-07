class PurchasesController < ApplicationController
  before_action :find_purchase, only: %i[show edit update destroy]

  def index
    @purchases = Purchase.all
  end

  def show; end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchases_params)
    if @purchase.save
      redirect_to root_path
    else
      redirect_to :new
    end

  end

  def destroy

  end

  def edit; end

  def update
    if @purchase.update_attributes(purchases_params)
      redirect_to root_path
    else
      render :edit
    end

  def destroy
    if @purchase.destroy
      redirect_to root_path
    end
  end
  end

  private
  def find_purchase
    @purchase  = Purchase.find(params[:id])
  end

  def purchases_params
    params.require(:purchase).permit(
      :title, :price, :short_description, :full_description, :in_stock, :category_id, :all_tags
    )
  end
end

