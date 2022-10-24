class Public::VoicePostsController < ApplicationController

  def new
    @voice_posts = VoicePost.new
  end

  def create
    @voice_posts = VoicePost.new(voice_posts_params)
    @voice_posts.voice = params[:voice_post][:voice]
    @voice_posts.customer_id = current_customer.id
    if @voice_posts.save
    redirect_to public_voice_posts_path
    else
    render :new
    end
  end

  def index
    @customers = Customer.find(params[:id]) #user infoのuser nameから受け取る
    @voice_posts = @customers.voice_posts
  end

  def show
    @voice_posts = VoicePost.find(params[:id])
    @comment_posts = CommentPost.new
    # @customers = VoicePost.customers
    # @customer = Customer.find(params[:id])
    # @post_tag = @post.tags
  end

  def destroy
    @voice_posts = VoicePost.find(params[:id])
    @voice_posts.destroy
    redirect_to public_voice_posts_path
  end

  def hashtag
    @customer = current_customer
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.voice_post.count}
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @voice_posts = @hashtag.voice_posts
      # .page(params[:page]).per(20).reverse_order
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.voice_posts.count}
    end
  end


  private

  def voice_posts_params
    params.require(:voice_post).permit(:title, :introduction, :voice, :category, hashtag_ids: [])
  end

end
