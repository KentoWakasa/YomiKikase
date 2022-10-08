class CommentPost < ApplicationRecord
  belongs_to :voice_post
  belongs_to :customer
end
