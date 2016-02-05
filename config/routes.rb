Rails.application.routes.draw do
  root to: 'gifs#new'

  devise_for :users

  scope :gifs do
    get 'search', to: 'gifs#search', as: 'gifs_search'
  end

  resources :gifs
end
