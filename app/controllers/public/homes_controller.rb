class Public::HomesController < ApplicationController

  def top
    # if customer_signed_in?
    #   @voice_posts = VoicePost.where(customer_id: [current_customer.id, *current_customer.following_ids])
    # else
      @voice_posts = VoicePost.last(10)
    # end
  end


end
