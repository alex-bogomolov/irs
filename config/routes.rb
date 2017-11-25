Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#root'

  resources :investors
  resources :investments
  resources :investment_data

  get '/views' => 'views#index'
  get '/functions' => 'functions#index'
end
