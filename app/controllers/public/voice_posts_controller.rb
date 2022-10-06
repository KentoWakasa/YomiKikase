class Public::VoicePostsController < ApplicationController

  def new
    @voice_posts = VoicePost.new
  end

  def create
    @voice_posts = VoicePost.new(voice_posts_params)
    @voice_posts.voice = params[:voice_post][:voice]
    # @voice_posts.customer_id = current_customer_user.id
    @voice_posts.save!
    redirect_to public_voice_posts_path
  end

  def index
    @voice_posts = VoicePost.all
  end

  def destroy
    @voice_posts = VoicePost.find(params[:id])
    @voice_posts.destroy
    redirect_to public_voice_posts_path
  end

  private

  def voice_posts_params
    params.require(:voice_post).permit(:title, :introduction, :voice)
  end

end
