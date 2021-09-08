class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :ship_fee_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

end


