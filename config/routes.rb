Rails.application.routes.draw do

  root to: 'visitors#index'

  devise_for :users, :skip => [:passwords]

  devise_scope :user do
  	get "/admin" => "devise/sessions#new"
	end

	resources :blogs
	resources :contacts, only: [:new, :create]

	get "/about" => "pages#about", :as => :about
	get "/services" => "pages#services", :as => :services

	get '/robots.txt' => 'home#robots'

  mount RedactorRails::Engine => '/redactor_rails'

end
