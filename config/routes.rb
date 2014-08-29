Rails.application.routes.draw do

  root to: 'visitors#index'

  devise_for :users, :skip => [:registrations, :passwords]

  devise_scope :user do
  	get "/admin" => "devise/sessions#new"
	end

	resources :blog

	get "/about" => "pages#about", :as => :about
	get "/admin" => "blog#new"
	
end
