Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index]
      resources :invoices, only: [:index]
      resources :transactions, only: [:index]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
