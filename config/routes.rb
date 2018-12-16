Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
    resources :users, only: [:index, :show, :new, :create] do
        member do
         get :likes
        end
    end
    
# 本の検索・閲覧
    resources :books, only: [:index, :show]
    
# お気に入り機能
    resources :users_books, only: [:create, :destroy]
   
end
