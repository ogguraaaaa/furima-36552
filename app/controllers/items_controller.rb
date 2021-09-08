class ItemsController < ApplicationController
  def index
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(user_params)
    if @item.save
      redrect_to root_path
    else
      render 'new'
    end
  end

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end


