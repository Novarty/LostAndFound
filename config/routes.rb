Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :answers
	root 'items#index'
  resources :questions
  resources :items

  get 'users/:id', to: 'users#show', as: 'user'
  # for search in tags
  get 'tags/:tag', to: 'items#index', as: "tag"


end
