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
	end

	resources :events, :only => [:index]
	resources :resources, :only => [:index]
	
	match "join" => "colophon#join"
  match "about" => "colophon#about"
  match "people" => "colophon#people"
  match "privacy" => "colophon#privacy"
	match "inspiration" => "posts#index"
	match "inspiration/(:tag)/(type/:type)" => "posts#filtered", :as => "post_filter"

	root :to => "home#index"

end