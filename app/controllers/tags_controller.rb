class TagsController < ApplicationController

  def show
   @tag = Tag.find_by(name: params[:id])
   @purchases = @tag.purchases
  end
end

