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
         with_options format: { with: /\A[a-zA-Z0-9]+\z/} do
          validates :password
          validates :password_confirmation
         end
         validates :nickname, presence: true
end