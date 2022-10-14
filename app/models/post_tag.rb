class PostTag < ApplicationRecord
  belongs_to :voice_posts
  belongs_to :tag
  validates :post_id, presence: true
  validates :tag_id, presence: true
end
