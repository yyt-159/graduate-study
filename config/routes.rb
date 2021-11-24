Rails.application.routes.draw do
  root to: "home#index"

  resources :tasks do
    member do
      post :done
      post :done_back
    end
    resources :sub_tasks do
      member do
        post :done
        post :done_back
      end
    end
  end

  
  
  # コントローラー作った時に書けって言われた
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
end
