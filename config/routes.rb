Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#root'

  resources :investors
  resources :investments
  resources :investment_data

  get '/views' => 'views#index'
  get '/functions' => 'functions#index'

  namespace :functions do
    get :align
    get :show_investors
    post :decrease_invest_amount
    post :recalculate_worth
    post :scale_invest_amounts
  end
end
