class HashtagVoicePost < ApplicationRecord
  belongs_to :voice_post
  belongs_to :hashtag
  validates :voice_post_id, presence: true
  validates :hashtag_id, presence: true
end
