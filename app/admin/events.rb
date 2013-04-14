ActiveAdmin.register Event do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
	config.filters = false
  
  menu :if => proc{ can?(:manage, Event) }
  
	index do
    column("Title") { |event| link_to event.title, admin_event_path(event) }
		column("Date") { |event| event.date.to_s(:event) }
    column "" do |event|
      "#{link_to "Edit", edit_admin_event_path(event)} &nbsp; #{link_to "Delete", admin_event_path(event), :method => "delete", :confirm => "Are you sure you wish to delete this event?"}".html_safe
    end
  end

	show  do |event|
    panel 'event' do
      attributes_table_for event do
        row "Homepage Banner?" do
           (resource.featured) ? "Yes" : "No" 
        end
        row :title
				row "Date" do
				  event.date.to_s(:event)
				end
				row "Link" do
					event.url
				end
				row :image do
          image_tag(resource.image.thumbnail) unless resource.image.url.nil?
        end
        row "Description" do
					simple_format event.body
				end
    	end
		end
  end

	form do |f|
		
		f.inputs "Features" do
      f.input :featured, :label => "Feature as a homepage banner?"
			f.input :excerpt, :input_html => { :rows => 3 }, :hint => "Shown to the right of event homepage banners"
    end
		
    f.inputs "Event" do		
      f.input :title
      f.input :date, :as => :date
			f.input :url, :label => "Link"
			f.input :image, :label => ("New Image" unless f.object.new_record?), :hint => "Image must be at least 231px by 150px, if featured on homepage it must be at least 750px wide"
      f.input :body, :label => "Description", :input_html => { :rows => 5 }
    end
    
	  f.input :user_id, :as => :hidden, :value => current_user.id if f.object.new_record? || f.object.user.nil?
		
    f.buttons
  end
    
end