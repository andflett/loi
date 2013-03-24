ActiveAdmin.register Event do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
	filter :title
	filter :date
  
  menu :if => proc{ can?(:manage, Event) }
  
	index do
    column("Title") { |event| link_to event.title, admin_event_path(event) }
		column("Date") { |event| event.date }
    column "" do |event|
      "#{link_to "Edit", edit_admin_event_path(event)} &nbsp; #{link_to "Delete", admin_event_path(event), :method => "delete", :confirm => "Are you sure you wish to delete this event?"}".html_safe
    end
  end

	show  do |event|
    panel 'event' do
      attributes_table_for event do
        row :title
				row :date
				row "Link" do
					event.url
				end
        row "Description" do
					simple_format event.body
				end
    	end
		end
  end

	form do |f|
		
    f.inputs "Event" do		
      f.input :title
      f.input :image
			f.input :date
			f.input :url, :label => "Link"
      f.input :body, :label => "Description", :input_html => { :rows => 5 }
    end
    
    f.inputs "Homepage" do
      f.input :featured, :label => "Featured on homepage?"
			f.input :excerpt, :input_html => { :rows => 3 }, :label => "Short description"
    end
    
    f.inputs "Published by" do
      if f.object.new_record? || f.object.user.nil?
		    f.input :user_id, :as => :hidden, :value => current_user.id
			end
    end
		
    f.buttons
  end
    
end