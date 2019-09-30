Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      resources :investments
      resources :stocks  

      # route to login
			post "/login", to: "auth#login"

			# login on refresh
			get '/auto_login', to: "auth#auto_login"

    end
  end

end
