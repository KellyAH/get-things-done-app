Rails.application.routes.draw do
  resources :thoughts
  root to: 'homepage#index'

  get "/thoughts/:id", to: "thoughts#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
