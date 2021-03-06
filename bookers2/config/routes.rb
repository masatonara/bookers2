Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root to: 'homes#top'
  get  'home/about' => 'homes#about'
  get '/search' => 'search#search'
  
    resources :books, only: [:create, :index,  :show, :edit, :update, :destroy] do
      resource :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  
    resources :users, only: [:show, :index, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

end
