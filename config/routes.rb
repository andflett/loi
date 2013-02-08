Leagueofintrapreneurs::Application.routes.draw do
	
  ActiveAdmin.routes(self)

  post 'attachments' => 'images#create' # Sir Trevor images
    
  devise_for :users, :controllers => { :registrations => :registrations } 

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  resources :posts, :only => [:show] do
		get :autocomplete_tag_name, :on => :collection  
		collection do 
			resources :types, :only => [:show]
		end
	end

	resources :events, :only => [:index]
	resources :resources, :only => [:index]
	
	match "join" => "colophon#join"
  match "about" => "colophon#about"
  match "partners" => "colophon#partners"
  match "privacy" => "colophon#privacy"
	match "inspiration" => "posts#index"
	
	root :to => "home#index"

end