Rails.application.routes.draw do
  resources :questions
  resources :items
  devise_for :users, :controllers => { registrations: 'registration/registrations' }
end
