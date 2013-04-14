ActiveAdmin.register Intrapreneur do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  menu :priority => 2, :if => proc{ can?(:manage, Intrapreneur) }

  config.filters = false
  
  index do
    column("Name") { |intrapreneur| link_to intrapreneur.name, admin_intrapreneur_path(intrapreneur) }
    column "" do |intrapreneur|
      "#{link_to "Edit", edit_admin_intrapreneur_path(intrapreneur)} &nbsp; #{link_to "Delete", admin_intrapreneur_path(intrapreneur), :method => "delete", :confirm => "Are you sure you wish to delete this intrapreneur?"}".html_safe
    end
  end
  
  show  do |intrapreneur|
    panel 'Intrapreneur' do
      attributes_table_for intrapreneur do
        row "Homepage Banner?" do
           (intrapreneur.featured) ? "Yes" : "No" 
        end
        row "Founder?" do
           (intrapreneur.founder) ? "Yes" : "No" 
        end
        row "Advisor?" do
           (intrapreneur.advisor) ? "Yes" : "No" 
        end
        row :name
        row :job_title
				row :quote
				row :link
				row :hero_image do
          image_tag(intrapreneur.hero_image.thumbnail) unless intrapreneur.hero_image.url.nil?
        end
        row "Description" do
					if intrapreneur.body.is_json?
      		  render_sir_trevor(intrapreneur.body)
      		else
      		  sir_trevor_markdown(intrapreneur.body).html_safe
      		end
				end
    	end
		end
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		
		f.inputs "Features" do
				f.input :featured, :label => "Featured as a homepage banner?"
				f.input :founder, :label => "Listed as a founder?"
				f.input :advisor,  :label => "Listed as an advisor?"
		end
		
    f.inputs "Details" do			
      f.input :name
      f.input :job_title
      f.input :quote, :hint => "If featured as a homepage banner, this quote will be used in place of their image."
      f.input :link, :hint => "Link to an external site where people can read more about this intrapreneur."
      f.input :hero_image, :label => ((f.object.new_record?) ? "Image" : "New Image"), :hint => "Image must be at least 317px by 220px, if featured on homepage it must be at least 750px wide"
    end

    f.inputs "Their story" do
      if intrapreneur.new_record? || intrapreneur.body.is_json?
        f.sir_trevor_text_area :body
      else 
        f.input :body
      end
    end
    
    f.input :user_id, :as => :hidden, :value => current_user.id if f.object.new_record? || f.object.user.nil?
		
    f.buttons
    
  end
  
end