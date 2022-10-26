class Public::VoicePostsController < ApplicationController

  def new
    @voice_posts = VoicePost.new
  end

  def create
    @voice_posts = VoicePost.new(voice_posts_params)
    @voice_posts.voice = params[:voice_post][:voice]
    @voice_posts.customer_id = current_customer.id
    if @voice_posts.save
    redirect_to root_path
    else
    render :new
    end
  end

  def index
    @voice_post = Customer.find(params[:id])

    # @voice_post = VoicePost.find(params[:id])
    # @customers = @voice_post.customer #user infoのuser nameから受け取る
    @voice_posts = @voice_post.voice_posts
  end

  def show
    @voice_posts = VoicePost.find(params[:id])
    @voice_post = @voice_posts.customer
    @comment_posts = CommentPost.new
    # @customers = VoicePost.customers
    # @customer = Customer.find(params[:id])
    # @post_tag = @post.tags
  end

  def destroy
    @voice_posts = VoicePost.find(params[:id])
    @voice_posts.destroy
    redirect_to root_path
  end

  def edit
   @voice_post = VoicePost.find(params[:id])
  end

  def update
    voice_post = VoicePost.find(params[:id])
    voice_post.update(voice_posts_params)
    redirect_to public_voice_post_path(voice_post.id)
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
    params.require(:voice_post).permit(:title, :introduction, :image, :voice, :category, hashtag_ids: [])
  end

end
