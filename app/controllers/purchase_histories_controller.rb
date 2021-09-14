class PurchaseHistoriesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :purchase_history_url, only: [:index, :crate]

  def index
    @order_purchase_history = OrderPurchaseHistory.new
  end

  def create
    @order_purchase_history = OrderPurchaseHistory.new(params_permit)
    if @order_purchase_history.valid?
      pay_item
      @order_purchase_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def params_permit
    params.require(:order_purchase_history).permit(:postal_code, :number, :city, :address, :prefecture_id, :building).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_f9784dfe7a481a4a1cf27298"
    Payjp::Charge.create(
      amount: @item.price,
      card: params_permit[:token],
      currency: 'jpy'
    )
  end

  def purchase_history_url
    redirect_to root_path if @item.user_id == current_user.id || !@item.purchase_history.nil?
  end
end


