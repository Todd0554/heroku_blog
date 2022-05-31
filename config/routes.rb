Rails.application.routes.draw do
  devise_for :users
  # get '/articles', to: 'articles#index'
  # get 'articles/new', to: 'articles#new'
  root 'articles#index', as: "home"
  resources :articles do
    resources :comments # comment is a nested resource of articles
  end
end
