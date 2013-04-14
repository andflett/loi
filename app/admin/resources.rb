ActiveAdmin.register Resource do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end

	config.filters = false
  
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
        row "Homepage Banner?" do
           (resource.featured) ? "Yes" : "No" 
        end
        row :title
				row "Link" do
					resource.url
				end
				row :image do
          image_tag(resource.image.thumbnail) unless resource.image.url.nil?
        end
        row "Description" do
					simple_format resource.body
				end
    	end
		end
  end

	form do |f|
		
		f.inputs "Features" do
	    f.input :featured, :label => "Feature as a homepage banner?"
    end
		
    f.inputs "Resource" do
      f.input :title
			f.input :url, :label => "Link"
			f.input :image, :label => ("New Image" unless f.object.new_record?), :hint => "Image must be at least 231px by 150px, if featured on homepage it must be at least 750px wide"
      f.input :body, :label => "Description", :input_html => { :rows => 6 }
    end
  
    f.input :user_id, :as => :hidden, :value => current_user.id if f.object.new_record? || f.object.user.nil?
		
    f.buttons
  end
 
end