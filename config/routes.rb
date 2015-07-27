Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show]
      get '/merchants/random', to: 'merchants#random'

      resources :items, only: [:show]
      get '/items/random', to: 'items#random'

      resources :invoice_items, only: [:show]
      get '/invoice_items/random', to: 'invoice_items#random'

      resources :customers, only: [:show]
      get '/customers/random', to: 'customers#random'

      resources :invoices, only: [:show]
      get '/invoices/random', to: 'invoices#random'

      resources :transactions, only: [:show]
      get '/transactions/random', to: 'transactions#random'
    end
  end
end
