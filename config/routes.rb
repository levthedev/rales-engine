Rails.application.routes.draw do
  namespace :api do
    namespace :v1, :defaults => { :format => 'json' } do
      get '/merchants/find_all', to: 'merchants#search_all'
      get '/merchants/find', to: 'merchants#search'
      get '/merchants/random', to: 'merchants#random'
      resources :merchants, only: [:show]

      get '/items/find_all', to: 'items#search_all'
      get '/items/find', to: 'items#search'
      get '/items/random', to: 'items#random'
      resources :items, only: [:show]

      get '/invoice_items/find_all', to: 'invoice_timess#search_all'
      get '/invoice_items/find', to: 'invoice_items#search'
      get '/invoice_items/random', to: 'invoice_items#random'
      resources :invoice_items, only: [:show]

      get '/customers/find_all', to: 'customers#search_all'
      get '/customers/find', to: 'customers#search'
      get '/customers/random', to: 'customers#random'
      resources :customers, only: [:show]

      get '/invoices/find_all', to: 'invoicess#search_all'
      get '/invoices/find', to: 'invoices#search'
      get '/invoices/random', to: 'invoices#random'
      resources :invoices, only: [:show]

      get '/transactions/find_all', to: 'transactionss#search_all'
      get '/transactions/find', to: 'transactions#search'
      get '/transactions/random', to: 'transactions#random'
      resources :transactions, only: [:show]
    end
  end
end
