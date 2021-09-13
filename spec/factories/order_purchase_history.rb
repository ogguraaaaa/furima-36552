FactoryBot.define do
  factory :order_purchase_history do
    postal_code { '123-4567' }
    number { '09012345678' }
    city { '取手市' }
    address { '5-2' }
    prefecture_id { 10 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
