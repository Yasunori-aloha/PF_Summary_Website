class Tag < ApplicationRecord
  has_many :posts_tags
  has_many :posts, through: :posts_tags

  validates :tag_name, presence: true
end
