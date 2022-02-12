Rails.application.routes.draw do
  devise_for :admins
  
  devise_for :sales_employees

  namespace :users_backoffice do
    get 'welcome/index'
    resources :sales
    resources :products, except: [:show, :new]
    resources :categories, except: [:show, :new]
  end

  root to: "users_backoffice/welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
