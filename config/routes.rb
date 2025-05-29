Rails.application.routes.draw do
  root "home#index"

  resources :articles
  resources :notifications
  resources :schedules
  resources :events
  resources :users
  resources :departments, only: [:index, :show]
  resources :employees, only: [:index, :show]
  resources :photos, only: [:destroy]
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root to: "dashboard#index"
    resources :users
    resources :articles
    resources :photos, only: [:destroy]
    resources :notifications do
      member do
        patch :publish
        patch :unpublish
      end
    end
    resources :events
    resources :schedules
    resources :departments
    resources :employees
  end

  match "/404", to: "errors#not_found", via: :all
  match "*path", to: "errors#not_found", via: :all, constraints: ->(req) { req.format.html? }

  # get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest
end
