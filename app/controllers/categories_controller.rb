class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @purchases = Purchase.where(category_id: [@category.subtree_ids])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      redirect_to :new
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      redirect_to :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
    end
  end

  private
  def find_category
    @category  = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

end
