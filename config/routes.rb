Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'invoices_random/show'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show] do
        collection do
          get "/find", to: "invoices_find#show"
          get "/find_all", to: "invoices_find#index"
          get "/random", to: "invoices_random#show"
        end
        resources :merchants, only: [:index, :show] do
          collection do
            get "/find", to: "merchants_find#show"
            get "/find_all", to: "merchants_find#index"
            get "/random", to: "merchants_random#show"
          end
        end
      end
      resources :transactions, only: [:index, :show] do
        collection do
          get "/find", to: "transactions_find#show"
          get "/find_all", to: "transactions_find#index"
          get "/random", to: "transactions_random#show"
        end
      end
      resources :customers, only: [:index, :show] do
        collection do
          get "/find", to: "customers_find#show"
          get "/find_all", to: "customers_find#index"
          get "/random", to: "customers_random#show"
        end
      end
    end
  end
end
