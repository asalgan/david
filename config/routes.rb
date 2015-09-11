Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  root to: 'visitors#index'

  devise_for :users, :skip => [:registrations, :passwords]

  devise_scope :user do
  	get "/admin" => "devise/sessions#new"
	end

	resources :blogs
	resources :contacts, only: [:new, :create]

	get "/about" => "pages#about", :as => :about
	get "/services" => "pages#services", :as => :services

	get '/robots.txt' => 'home#robots'

end
