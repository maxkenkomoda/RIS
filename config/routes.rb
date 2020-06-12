Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #toppages routes
  get 'about', to: 'toppages#about'
  get 'news', to: 'toppages#news'

  #devise funciton routes
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  #for like, unlike and mypage
  resources :users, only: [:show] do
    member do
      get :likes
      post :like
      post :unlike
    end
  end
  
#For main function
  resources :maps, only: [:show, :new, :create, :edit, :update, :destroy] do
    #for reply function
    resources :replies, only: [:create, :destroy]
  end

end
