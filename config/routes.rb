Rails.application.routes.draw do
	root 'items#index'
  resources :questions
  resources :items
  # for search in tags
  get 'tags/:tag', to: 'items#index', as: "tag"
  
  devise_for :users, :controllers => { registrations: 'registration/registrations' }
end
