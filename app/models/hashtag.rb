class Hashtag < ApplicationRecord
  validates :hashname, presence: true
  has_many :hashtag_voice_posts, dependent: :destroy
  has_many :voice_posts, through: :hashtag_voice_posts
end