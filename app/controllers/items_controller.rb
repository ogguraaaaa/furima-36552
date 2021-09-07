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
end
