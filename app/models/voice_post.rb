class VoicePost < ApplicationRecord
  has_one_attached :voice
  has_one_attached :image

  belongs_to :customer

  has_many :comment_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :hashtag_voice_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_voice_posts

  after_create do
    voice_post = VoicePost.find_by(id: id)
    hashtags = category.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      voice_post.hashtags << tag
    end
  end

  before_update do
    voice_post = VoicePost.find_by(id: id)
    voice_post.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      voice_post.hashtags << tag
    end
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end