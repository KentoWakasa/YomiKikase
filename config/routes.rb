Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  root to: 'public/homes#top'
  post 'public/homes/guest_sign_in', to: 'public/homes#guest_sign_in'


  namespace :public do
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :customer do
    post  'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end
end
