class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :destory, :update]
  before_action :edit_cancel, only: :edit

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :ship_fee_id, :prefecture_id,
                                 :ship_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path unless current_user == @item.user
  end

  def edit_cancel
    redirect_to root_path if @item.purchase_history.present?
  end
end
