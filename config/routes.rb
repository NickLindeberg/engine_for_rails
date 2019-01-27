Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoices', to: 'customer_invoices#show'
        get '/:id/transactions', to: 'customer_transactions#show'
      end
      resources :customers, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/item', to: 'invoice_items_item#show'
        get '/:id/invoice', to: 'invoice_items_invoice#show'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/merchant', to: 'invoice_merchant#show'
        get '/:id/customer', to: 'invoice_customer#show'
        get '/:id/items', to: 'invoice_items#show'
        get '/:id/invoice_items', to: 'invoice_invoice_items#show'
        get '/:id/transactions', to: 'invoice_transactions#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :items do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoice_items', to: 'item_invoice_item#show'
        get '/:id/merchant', to: 'item_merchant#show'
      end
      resources :items, only: [:index, :show]

      namespace :merchants do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get 'find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoice', to: 'transaction_invoice#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
