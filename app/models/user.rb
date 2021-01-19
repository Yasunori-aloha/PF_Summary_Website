class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :password_confirmation
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}\z/i }, confirmation: true
end
