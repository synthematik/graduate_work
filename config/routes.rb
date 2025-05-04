Rails.application.routes.draw do
  root "home#index"

  resources :articles
  resources :users
  resource :session, only: [:new, :create, :destroy]

  # get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest
end
