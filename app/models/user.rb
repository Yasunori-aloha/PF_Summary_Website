class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #アソシエーション
         has_many :posts
         has_many :comments
         has_many :likes
         has_many :bookmarks
         #バリデーション
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i}
         validates :nickname, presence: true
         validates :password, confirmation: true
end