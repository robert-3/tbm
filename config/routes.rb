Rails.application.routes.draw do
  
  
  devise_for :users
  get '/employer' => "employers#index", as: :user_root
  get 'display/index'
  root 'display#index'

  resources :employers do
    resources :employees, :budgets
  end
  
  resources :employees do
    resources :timesheets
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
