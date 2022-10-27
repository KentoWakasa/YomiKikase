Rails.application.routes.draw do

  root to: 'public/homes#top'


  namespace :admin do
    resources :customers
  end


  namespace :public do

    resources :voice_posts do
      resource :favorites
      resources :comment_posts
    end

    resources :customers do
      resource :relationships
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      collection do
        get 'search'
      end
    end

    get 'homes/top/sort/new', to: 'homes#top', as: 'sort_new'
    get 'homes/top/sort/favorites', to: 'homes#top', as: 'sort_favorites'



    get '/voice_posts/hashtag/:name' => "voice_posts#hashtag", as: "hashtag"

  end


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


end
