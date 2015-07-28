Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      controllers = %w[merchants customers items invoices transactions invoice_items]
      controllers.each do |controller|
        get "/#{controller}/find_all", to: "#{controller}#search_all"
        get "/#{controller}/find", to: "#{controller}#search"
        get "/#{controller}/random", to: "#{controller}#random"
      end

      resources :merchants, only: [:show] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      resources :customers, only: [:show] do
        resources :invoices, only: [:index]
        get '/transactions', to: 'customers#transactions'
      end

      resources :items, only: [:show] do
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'items#merchant'
      end

      resources :invoices, only: [:show] do
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        get '/customer', to: 'invoices#customer'
        get '/merchant', to: 'invoices#merchant'
      end

      resources :transactions, only: [:show] do
        get '/invoice', to: 'transactions#invoice'
      end

      resources :invoice_items, only: [:show] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item', to: 'invoice_items#item'
      end
    end
  end
end
