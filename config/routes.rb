Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show], :controller => "invoices/invoices" do
        get "/transactions", to: "invoices/invoices_transactions#index"
        get "/invoice_items", to: "invoices/invoices_invoice_items#index"
        get "/items", to: "invoices/invoices_items#index"
        get "/customer", to: "invoices/invoices_customer#show"
        get "/merchant", to: "invoices/invoices_merchant#show"
        collection do
          get "/find", to: "invoices/invoices_find#show"
          get "/find_all", to: "invoices/invoices_find#index"
          get "/random", to: "invoices/invoices_random#show"
        end
      end

      resources :items, only: [:index, :show] , :controller => "item/items" do
        get "/best_day", to: "item/items_best_day#show"
        get "/invoice_items", to: "item/items_invoice_items#index"
        get "/merchant", to: "item/items_merchant#show"
        collection do
          get "/most_revenue", to: "item/items_most_revenue#index"
          get "/most_items", to: "item/items_most_items#index"
          get "/find", to: "item/items_find#show"
          get "/find_all", to: "item/items_find#index"
          get "/random", to: "item/items_random#show"
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
        get "/customers_with_pending_invoices", to: "merchants/merchants_pending_customers#index"
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
      resources :transactions, only: [:index, :show], :controller => "transaction/transactions" do
        get "/invoice", to: "transaction/transactions_invoice#show"
        collection do
          get "/find", to: "transaction/transactions_find#show"
          get "/find_all", to: "transaction/transactions_find#index"
          get "/random", to: "transaction/transactions_random#show"
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
