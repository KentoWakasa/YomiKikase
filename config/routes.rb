Rails.application.routes.draw do

  namespace :admin do
    resources :customers
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
  end


  namespace :public do

    resources :voice_posts do
      resource :favorites
      resources :comment_posts
    end

    get '/voice_posts/hashtag/:name' => "voice_posts#hashtag", as: "hashtag"

    resources :customers do
      resource :relationships
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      collection do
      get 'search'
      end
    end


end

  root to: 'public/homes#top'
  # post 'public/sessions/guest_sign_in', to: 'public/sessions#guest_sign_in'


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
