ActiveAdmin.register Intrapreneur do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  filter :name
  
  index do
    column("Name") { |intrapreneur| link_to intrapreneur.name, admin_intrapreneur_path(intrapreneur) }
    column "" do |intrapreneur|
      "#{link_to "Edit", edit_admin_intrapreneur_path(intrapreneur)} &nbsp; #{link_to "Delete", admin_intrapreneur_path(intrapreneur), :method => "delete", :confirm => "Are you sure you wish to delete this intrapreneur?"}".html_safe
    end
  end  
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		
		f.inputs "Features" do
				f.input :featured, :label => "Featured on homepage?"
		end
		
		if f.object.new_record? || f.object.user.nil?
    	f.input :user_id, :as => :hidden, :value => current_user.id
		end
		
    f.inputs "intrapreneur" do   
      f.input :hero_image, :label => "Image"
      f.input :name
      f.input :quote
      f.input :job_title
      f.input :link
    end

    f.inputs "Body" do
      if intrapreneur.new_record? || intrapreneur.body.is_json?
        f.sir_trevor_text_area :body
      else 
        f.input :body
      end
    end
		
    f.buttons
  end
  
end