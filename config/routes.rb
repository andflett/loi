Leagueofintrapreneurs::Application.routes.draw do
	
  ActiveAdmin.routes(self)

  post 'attachments' => 'images#create' # Sir Trevor images
    
  devise_for :users, :controllers => { :registrations => :registrations } 

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  resources :posts, :only => [:show, :index]
	resources :categories, :only => [:show]
	resources :tags, :only => [:show]
	
	match "press" => "colophon#press"
	match "partners" => "colophon#partners"
  match "about" => "colophon#about"
  match "privacy" => "colophon#privacy"

	root :to => "home#index"

end