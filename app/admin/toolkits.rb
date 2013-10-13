ActiveAdmin.register Toolkit do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end

  menu :priority => 5, :if => proc{ can?(:manage, Toolkit) }
    
  config.filters = false
  
	index do
    column("Title") { |toolkit| link_to toolkit.title, admin_toolkit_path(toolkit) }
    column "" do |toolkit|
      "#{link_to "Edit", edit_admin_toolkit_path(toolkit)} &nbsp; #{link_to "Delete", admin_toolkit_path(toolkit), :method => "delete", :confirm => "Are you sure you wish to delete this toolkit?"}".html_safe
    end
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		
    f.inputs "Toolkit" do   
      f.input :priority, :label => "Toolkit number"
      f.input :title			
      f.input :subtitle
      f.input :description, :input_html => { :rows => 3 }
      f.input :download, :label => "PDF download"
    end
    
    f.buttons
  end
  
  show  do |toolkit|
    panel 'Toolkit' do
      attributes_table_for toolkit do
        row :priority
        row :title
        row :subtitle
        row :description
      end
    end
  end

end
