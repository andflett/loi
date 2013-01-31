ActiveAdmin.register Tag do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :if => proc{ can?(:manage, Category) }
    
end