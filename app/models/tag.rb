class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :voice_posts, trhough: :post_tags

  validates :name, uniqueness: true, peresence: true
end
