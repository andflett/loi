Leagueofintrapreneurs::Application.routes.draw do
	
  ActiveAdmin.routes(self)

  post 'attachments' => 'images#create' # Sir Trevor images
    
  devise_for :users, :controllers => { :registrations => :registrations } 

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  resources :posts, :only => [:show]
	resources :tags, :only => [:show]
	resources :types, :only => [:show]

	resources :events, :only => [:show, :index]
	resources :resources, :only => [:index]
	
	match "join" => "colophon#join"
  match "about" => "colophon#about"
  match "privacy" => "colophon#privacy"

	root :to => "home#index"

end