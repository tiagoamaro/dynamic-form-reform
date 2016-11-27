Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :states, only: [:index, :create] do
    collection do
      delete 'destroy_all'
    end
  end

  root to: 'states#index'
end
