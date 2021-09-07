class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
  
end

  #validates :password, presence: true REGEX
  #validates :nickname, presence: true
  #validates :first_name, presence: true 全角
  #validates :last_name, presence: true 全角
  #validates :first_name_kana, presence: true カナ
  #validates :last_name_kana, presence: true カナ
  #validates :birthday, presence: true