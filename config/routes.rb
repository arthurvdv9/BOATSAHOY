Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :boats, except: [:destroy, :edit] do
    resources :bookings, except: [:destroy]
  end
  resources :bookings, only: [:destroy]

  get "/mybookings", to: "bookings#mybookings", as: "mybookings"
  get "/pendingrequests", to: "bookings#pending_requests", as: "pendingrequests"
  patch "/bookings/:id/accept", to: "bookings#accept", as: "accept"
  patch "/bookings/:id/reject", to: "bookings#reject", as: "reject"

end
