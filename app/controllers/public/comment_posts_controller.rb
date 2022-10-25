class Public::CommentPostsController < ApplicationController

  def create
    voice_post = VoicePost.find(params[:voice_post_id])
    comment = current_customer.comment_posts.new(comment_post_params)
    comment.voice_post_id = voice_post.id
    comment.save
    redirect_to public_voice_post_path(voice_post)
  end

  private

  def comment_post_params
    params.require(:comment_post).permit(:comment)
  end

end
