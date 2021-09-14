require 'rails_helper'

RSpec.describe OrderPurchaseHistory, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_purchase_history = FactoryBot.build(:order_purchase_history, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_purchase_history).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_purchase_history.building = ''
        expect(@order_purchase_history).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'クレジットカード情報が空では保存できない' do
        @order_purchase_history.token = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include
      end
      it '郵便番号が空では保存できない' do
        @order_purchase_history.postal_code = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んでいないと保存できない' do
        @order_purchase_history.postal_code = '1234567'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県名が未選択では保存できない' do
        @order_purchase_history.prefecture_id = 1
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では保存できない' do
        @order_purchase_history.city = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @order_purchase_history.address = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order_purchase_history.number = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Number can't be blank")
      end
      it '電話番号が10桁未満では保存できない' do
        @order_purchase_history.number = '012345678'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include
      end
      it '電話番号が12桁以上では保存できない' do
        @order_purchase_history.number = '012345678901'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Number is invalid. Input half-width characters.')
      end
      it '電話番号が数値でなければ保存できない' do
        @order_purchase_history.number = '０１２３４５６７８９０'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Number is invalid. Input half-width characters.')
      end
      it 'itemが紐付いていないと保存できない' do
        @order_purchase_history.item_id = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order_purchase_history.user_id = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
