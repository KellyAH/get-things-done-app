Rails.application.routes.draw do
  resources :thoughts
  get 'homepage/greeting'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
