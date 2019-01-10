class PurchasesController < ApplicationController
  before_action :find_purchase, only: %i[show]

  def index
    @purchases =
      if params[:filter].present?
        @purchases.where(id: Tagging.where(tag_id: params[:filter]).pluck(:purchase_id))
      else
        Purchase.all
      end
  end

  def show; end

  private

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchases_params
    params.require(:purchase).permit(
      :title, :price, :short_description, :full_description, :in_stock, :category_id, :all_tags
    )
  end
end

