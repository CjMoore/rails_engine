Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices_transactions#index"
        get "/invoice_items", to: "invoices_invoice_items#index"
        get "/items", to: "invoices_items#index"
        get "/customer", to: "invoices_customer#show"
        get "/merchant", to: "invoices_merchant#show"
        collection do
          get "/find", to: "invoices_find#show"
          get "/find_all", to: "invoices_find#index"
          get "/random", to: "invoices/invoices_random#show"
        end
      end

      resources :items, only: [:index, :show] do
        get "/best_day", to: "items_best_day#show"
        get "/invoice_items", to: "items_invoice_items#index"
        get "/merchant", to: "items_merchant#show"
        collection do
          get "/most_revenue", to: "items_most_revenue#index"
          get "/most_items", to: "items_most_items#index"
          get "/find", to: "items_find#show"
          get "/find_all", to: "items_find#index"
          get "/random", to: "items_random#show"
        end
      end

      resources :invoice_items, only: [:index, :show], :controller => "invoice_item/invoice_items" do
        get "/invoice", to: "invoice_item/invoice_items_invoice#show"
        get "/item", to: "invoice_item/invoice_items_item#show"
        collection do
          get "/find", to: "invoice_item/invoice_items_find#show"
          get "/find_all", to: "invoice_item/invoice_items_find#index"
          get "/random", to: "invoice_item/invoice_items_random#show"
        end
      end

      resources :merchants, only: [:index, :show], :controller => "merchants/merchants" do
        get "/items", to: "merchants/merchants_items#index"
        get "/invoices", to: "merchants/merchants_invoices#index"
        get "/favorite_customer", to: "merchants/merchants_favorite_customer#show"
        get "/revenue", to: "merchants/merchants_revenue#show"
        collection do
          get "/revenue", to: "merchants/merchants_revenue#index"
          get "/most_revenue", to: "merchants/merchants_revenue#index"
          get "/most_items", to: "merchants/merchants_most_items#index"
          get "/find", to: "merchants/merchants_find#show"
          get "/find_all", to: "merchants/merchants_find#index"
          get "/random", to: "merchants/merchants_random#show"
        end
      end
      resources :transactions, only: [:index, :show] do
        get "/invoice", to: "transactions_invoice#show"
        collection do
          get "/find", to: "transactions_find#show"
          get "/find_all", to: "transactions_find#index"
          get "/random", to: "transactions_random#show"
        end
      end

      resources :customers, only: [:index, :show], :controller => "customers/customers" do
        get "/invoices", to: "customers/customers_invoices#index"
        get "/transactions", to: "customers/customers_transactions#index"
        get "/favorite_merchant", to: "customers/customers_favorite_merchant#show"
        collection do
          get "/find", to: "customers/customers_find#show"
          get "/find_all", to: "customers/customers_find#index"
          get "/random", to: "customers/customers_random#show"
        end
      end
    end
  end
end
