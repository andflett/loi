ActiveAdmin.register Resource do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end

	filter :title
	filter :url
  
  menu :if => proc{ can?(:manage, Resource) }
  
	index do
    column("Title") { |resource| link_to resource.title, admin_resource_path(resource) }
    column "" do |resource|
      "#{link_to "Edit", edit_admin_resource_path(resource)} &nbsp; #{link_to "Delete", admin_resource_path(resource), :method => "delete", :confirm => "Are you sure you wish to delete this resource?"}".html_safe
    end
  end

	show  do |resource|
    panel 'resource' do
      attributes_table_for resource do
        row :title
				row "Link" do
					resource.url
				end
        row "Description" do
					simple_format resource.body
				end
    	end
		end
  end

	form do |f|
		
    f.inputs "Resource" do  
      f.input :featured 
      f.input :title
      f.input :image
			f.input :url, :label => "Link"
      f.input :body, :label => "Description", :input_html => { :rows => 5 }
    end
    
    f.inputs "User" do
      if f.object.new_record? || f.object.user.nil?
		    f.input :user_id, :as => :hidden, :value => current_user.id
			end
    end
		
    f.buttons
  end
 
end