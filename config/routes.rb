Rails.application.routes.draw do
  root to: "home#index"
  get 'home/edit/:id' => "home#edit"
  post "home/update/:id" => "home#update"

  # tasks/sub_tasks
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

  # set_term
  resources :set_term, only: [:index, :new, :create, :edit, :destroy] do
    post :update
  end

  # team
  get 'team/:id/index' => "team#index"
  get 'team/:id/member' => "team#member"
  get 'team/team_rank' => "team#team_rank"
  
  # admin
  get 'admin/index' => "admin#index"
  post "admin/edit/update/:id" => "admin#update"
  get "admin/edit/:id" => "admin#edit"
  post "admin/reset/team_point" => "admin#reset_team_point"
  get "admin/team/edit/:id" => "admin#team_edit"
  post "admin/team/team_update/:id" => "admin#team_update"
  post "admin/reset_user_term_point" => "admin#reset_user_term_point"


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
