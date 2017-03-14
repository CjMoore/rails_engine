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
      end
    end
  end
end
