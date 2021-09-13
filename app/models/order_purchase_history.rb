class OrderPurchaseHistory
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :number, format: { with: /\A[0-9]{,11}\z/, message: 'is invalid. Input half-width characters.' }
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :prefecture_id
    end
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, number: number, city: city, address: address, prefecture_id: prefecture_id,
                 building: building, purchase_history: purchase_history)
  end
end
