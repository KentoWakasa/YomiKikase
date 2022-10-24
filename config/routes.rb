Rails.application.routes.draw do

  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :public do
    get 'customers/show'
    get 'customers/edit'

    resources :voice_posts do
      resource :favorites
      resources :comment_posts
    end

    get '/voice_posts/hashtag/:name', to: "voice_posts#hashtag"
    get '/voice_posts/hashtag' => 'voice_posts#hashtag'





    resources :customers do
      resource :relationships
      get 'followings' => 'registrations#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get :search, on: :collection
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
