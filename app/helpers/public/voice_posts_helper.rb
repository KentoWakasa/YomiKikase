module Public::VoicePostsHelper

  def render_with_hashtags(category)
    category.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){ |word| link_to word, "/public/voice_posts/hashtag/#{word.delete("#")}", data: {"turbolinks" => false} }.html_safe
  end

end
