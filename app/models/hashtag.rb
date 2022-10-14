class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum: 50 }
  has_many :hashtag_voice_posts, dependent: :destroy
  has_many :voice_posts, through: :hashtag_voice_posts
end