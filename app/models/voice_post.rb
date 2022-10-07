class VoicePost < ApplicationRecord
  has_one_attached :voice
  belongs_to :customer
  has_many :comment_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end