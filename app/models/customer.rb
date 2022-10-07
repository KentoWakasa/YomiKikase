class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :voice_posts, dependent: :destroy
  has_many :comment_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy


end
