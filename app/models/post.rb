class Post < ApplicationRecord
  #アソシエーション
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :posts_tags, dependent: :destroy
  has_many :tags, through: :posts_tags
  belongs_to :user
  
  #バリデーション
  with_options presence: true do
    validates :name
    validates :content, length: { maximum: 500 }
    validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
  end
end
