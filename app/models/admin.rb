class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validates :email, presence: true

 #imageの空白を防ぐ
  def get_image
    if image.attached?
      image
    else
      'no_image.png'
    end
  end

end
