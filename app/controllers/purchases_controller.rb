class PurchasesController < ApplicationController
  before_action :find_purchase, only: %i[show]

  def index
    @purchases =
      if params[:filters].present?
        Purchase.filter(category_id: params.dig(:filters, :category_id))
        Tagging.filter(tag_id: params.dig(:filters, :tag_id))
      else
        Purchase.all
      end

    respond_to do |format|
      format.html
      format.js
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

