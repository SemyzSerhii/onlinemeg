class TagsController < ApplicationController

  def show
   @tag = Tag.find_by(params[:id])
   @purchases = @tag.purchases
  end
end

