Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :customers, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :invoices, only: [:index, :show]

      namespace :items do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :items, only: [:index, :show]

      namespace :merchants do
        get 'find', to: 'find#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get 'find', to: 'find#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
