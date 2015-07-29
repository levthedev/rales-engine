Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      controllers = %w[merchants customers items invoices transactions invoice_items]
      controllers.each do |controller|
        get "/#{controller}/find_all", to: "#{controller}#find_all"
        get "/#{controller}/find", to: "#{controller}#find"
        get "/#{controller}/random", to: "#{controller}#random"
      end

      get '/merchants/most_revenue', to: 'merchants#most_revenue'
      get '/merchants/most_items', to: 'merchants#most_items'
      get '/merchants/revenue', to: 'merchants#revenue'
      get '/merchants/:id/favorite_customer', to: 'merchants#favorite_customer'
      get '/merchants/:id/customers_with_pending_invoices', to: 'merchants#pending'
      get '/merchants/:id/revenue', to: 'merchants#merchant_revenue'
      resources :merchants, only: [:show, :index] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      resources :customers, only: [:show, :index] do
        resources :invoices, only: [:index]
        get '/transactions', to: 'customers#transactions'
        get '/favorite_merchant', to: 'customers#favorite_merchant'
      end

      get '/items/most_revenue', to: 'items#most_revenue'
      get '/items/most_items', to: 'items#most_items'
      get '/items/best_day', to: 'items#best_day'
      get '/items/:id/best_day', to: 'items#best_day'
      resources :items, only: [:show, :index] do
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'items#merchant'
      end

      resources :invoices, only: [:show, :index] do
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        get '/customer', to: 'invoices#customer'
        get '/merchant', to: 'invoices#merchant'
      end

      resources :transactions, only: [:show, :index] do
        get '/invoice', to: 'transactions#invoice'
      end

      resources :invoice_items, only: [:show, :index] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item', to: 'invoice_items#item'
      end
    end
  end
end
