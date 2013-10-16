ActiveAdmin.register Comment do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
	config.filters = false
    
end