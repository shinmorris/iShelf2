Rails.application.routes.draw do


  get "cards" => "cards#index"
  post "pay" => "cards#pay"
  get "pay" => "cards#pay"
  resources :cards
  
  devise_for :kanris, controllers: {
    sessions:      'kanris/sessions',
    passwords:     'kanris/passwords',
    registrations: 'kanris/registrations',
    # get '/kanris/sign_out' => 'devise/sessions#destroy'
  }
  # https://hirocorpblog.com/post-284/
  root to: "posts#index"
  
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations' 
    # put 'users' => 'devise/registrations#update', :as => 'user_registration'   
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :users,only: [:index,:show,:update]do
     collection do
       get "kanri"
     end

   
   end

  resources :questions ,only: [:index,:show,:create,:destroy,:new] do 
    resources :comments ,only: [:destroy,:create] 
  end



  resources :tops ,only: [:index,:show] 
  resources :posts, only: [:index, :new,:create, :entry,:award,:kanrikanri] do
    collection do
      get 'entry'
      get 'award'
      get 'kanrikanri'
    end
  
    resource :likes, only: [:create, :destroy]
  end 

  resources :cards ,only: [:new,:index,:create] do
    collection do
      post 'pay'
    end
  end

  




end



