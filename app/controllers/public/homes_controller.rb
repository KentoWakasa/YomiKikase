class Public::HomesController < ApplicationController

  def top
    #新着とgood数順
    if params[:favorites]
        @voice_posts = VoicePost.left_joins(:favorites).group(:id).order('count(favorites.voice_post_id) desc').page(params[:page])
    elsif params[:new]
      @voice_posts = VoicePost.all.order(created_at: "ASC").page(params[:page])
    else
      @voice_posts = VoicePost.all.order(created_at: "ASC").page(params[:page])
    end
  end

end
