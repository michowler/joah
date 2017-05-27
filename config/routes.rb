Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root :to => "pages#index"

	resources :users do
	   resources :products
	end

	resources :products

	get '/sign_in' => 'sessions#new', as: "sign_in"
	post '/sign_in' => 'sessions#create'
	delete '/sign_out' => 'sessions#destroy', as: "sign_out"
	get '/sign_up' => 'users#new', as: "sign_up"
	post '/users' => 'users#create'

	get "/auth/:provider/callback" => "sessions#create_facebook"

end
