class VoicePost < ApplicationRecord
  has_one_attached :voice
  has_one_attached :image

  has_many :comment_posts, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :hashtag_voice_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_voice_posts

  belongs_to :customer
  

  validates :title, presence: true
  validates :introduction, presence: true
  validates :voice, presence: true
  validates :category, presence: true, inclusion: { in: %w(#), message: "#をつけてください" }


  #imageの空白を防ぐ
  def get_image
    if image.attached?
      image
    else
      'no_image.png'
    end
  end

  #いいね機能メソッド
  def favorited_by?(current_customer)
    favorites.exists?(customer_id: customer.id)
  end


  #hashtagの作成、updateメソッド
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
    hashtags = category.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      voice_post.hashtags << tag
    end
  end

end