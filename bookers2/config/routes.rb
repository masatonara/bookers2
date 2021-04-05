Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get  'home/about' => 'homes#about'
  resources :users, only: [:show, :index,  :edit, :update] 
    resources :books, only: [:create, :index,  :show, :edit, :update, :destroy] do
      resource :book_comments, only: [:create, :destr]
      resource :favorites, only: [:create, :destroy]
      
  end

end
