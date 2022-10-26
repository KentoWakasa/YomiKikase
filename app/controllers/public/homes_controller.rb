class Public::HomesController < ApplicationController

  def top
    # if customer_signed_in?
    #   @voice_posts = VoicePost.where(customer_id: [current_customer.id, *current_customer.following_ids])
    # else
      @voice_posts = VoicePost.all.order(created_at: "ASC")
    # end
  end

# def scope
#   scope :latest, ->{order(created_at: "ASC")}
# end


#   if params[new]
#     @voice_posts = VoicePost.latest(20)
#   else
#   end

end
