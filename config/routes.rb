Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :states, only: [:new, :create]

  root to: 'states#new'

end
