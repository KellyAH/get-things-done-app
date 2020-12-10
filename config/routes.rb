Rails.application.routes.draw do
  resources :thoughts
  root to: 'thoughts#index'

end
