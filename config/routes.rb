Rails.application.routes.draw do
  resources :items
  devise_for :users, :controllers => { registrations: 'registration/registrations' }
end
