class Public::HomesController < ApplicationController
  
  def top
    @voice_posts = current_customer.voice_posts.all
  end
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
  end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
