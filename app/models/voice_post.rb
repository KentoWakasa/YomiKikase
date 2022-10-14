class VoicePost < ApplicationRecord
  has_one_attached :voice
  belongs_to :customer
  has_many :comment_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :psot_tags, dependent: :destroy
  # has_many :tags, through: :post_tags

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


  # def save_tag(sent_tags)
  #   current_tags = self.tags.pluck(:name) unless self.tags.nill?
  #   old_tags = current_tags - sent_tags
  #   new_tags = sent_tags - current_tags

  #   old_tags.each do |old|
  #     slef.tags.delete Tag.find_by(name: old)
  #   end

  #   new_tags.each do |new|
  #     new.post_tag = Tag.find_or_create_by(name: new)
  #     self.tahs << new_post_tag
  #   end
  # end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end