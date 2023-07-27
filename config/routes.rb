Rails.application.routes.draw do
  resources :publications
  devise_for :users
  resource :publications do
    resource :comments, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "publications#index"
end
