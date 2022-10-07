class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :voice_post

end
