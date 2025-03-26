Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'stock/index'
    get 'stock/new'
    get 'stock/edit'
  end
  devise_for :admins

  devise_for :sales_employees

  namespace :users_backoffice do
    get 'welcome/index'
    get 'dashboard_sales', to: "sales#dashboad_sales"
    resources :sales do
      post :add_item
      post :close_sale
      # delete :remove_item
      # post '/add_item/:sale_item_id/:buy_amount', to: 'sales#add_item', as: :add_item
      post '/remove_item/:sale_item_id', to: 'sales#remove_item', as: :remove_item
    end

    resources :products, except: %i[show new]
    resources :categories, except: %i[show]
    resources :stocks, except: %i[show]
  end

  root to: "users_backoffice/products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
