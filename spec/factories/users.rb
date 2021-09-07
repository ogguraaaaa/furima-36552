FactoryBot.define do
  factory :user do
    nickname { 'abc' }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    email { Faker::Internet.free_email }
    password { 'aaa111' }
    password_confirmation { password }
    birthday { '1988-05-02' }
  end
end
