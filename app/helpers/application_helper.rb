module ApplicationHelper

  def hash_name(hashtag)
    "##{hashtag.hashname} (#{hashtag.voice_posts.count}) 件"
  end
  
end
