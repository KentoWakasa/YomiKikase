class Public::FavoritesController < ApplicationController

  def create
    voice_post = VoicePost.find(params[:voice_post_id])
    favorite = current_customer.favorites.new(voice_post_id: voice_post.id)
    favorite.save
    redirect_to public_voice_post_path(voice_post)
  end

  def destroy
    voice_post = VoicePost.find(params[:voice_post_id])
    favorite = current_customer.favorites.find_by(voice_post_id: voice_post.id)
    favorite.destroy
    redirect_to public_voice_post_path(voice_post)
  end
end
