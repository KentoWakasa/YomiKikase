class VoicePost < ApplicationRecord
  has_one_attached :voice
  belongs_to :customer
  has_many :comment_posts, dependent: :destroy
end