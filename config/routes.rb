Rails.application.routes.draw do
  resources :thoughts
  resources :tasks, only: [:new, :create]
  root to: 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
