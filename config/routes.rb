Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show] do
        collection do
          get "/find", to: "invoices_find#show"
          get "/find_all", to: "invoices_find#index"
        end
      end
    end
  end
end
