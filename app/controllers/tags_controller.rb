class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
   @tag = Tag.find_by(name: params[:id])
   @purchases = @tag.purchases
  end
end

