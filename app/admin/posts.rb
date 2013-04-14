ActiveAdmin.register Post do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 1, :if => proc{ can?(:manage, Post) }
    
  config.filters = false
  
	index do
    column("Title") { |post| link_to post.title, admin_post_path(post) }
    column("Type") { |post| post.type.title unless post.type.blank? }
    column("Author") { |post| post.user.name unless post.user.nil? }
    column "" do |post|
      "#{link_to "Edit", edit_admin_post_path(post)} &nbsp; #{link_to "Delete", admin_post_path(post), :method => "delete", :confirm => "Are you sure you wish to delete this post?"}".html_safe
    end
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		
		f.inputs "Features" do
	    f.input :featured, :label => "Feature as a homepage banner?"
    end
		
		f.inputs "Type of post" do
				f.input :type	
		end
		
		f.inputs "Podcast", :id => "podcast_fields" do
			f.input :download, :label => "File", :hint => "Upload your podcast in format mp3, ogg, wav or mp4"
		end
		
    f.inputs "Post" do   
      f.input :title			
      f.input :excerpt, :input_html => { :rows => 3 }
      f.input :hero_image, :label => ((f.object.new_record?) ? "Image" : "New Image"), :hint => "Image must be at least 317px by 220px, if featured on homepage it must be at least 750px wide"
    end
    
    f.inputs "Tags", :class => "autocomplete inputs" do
			f.autocomplete_field :tag_list, autocomplete_tag_name_posts_path, :"data-delimiter" => ', '
		end
    
    f.inputs "External article" do
		  f.input :url, :label => "Link"
		end

    f.inputs "... or write your article below" do
      if post.new_record? || post.body.is_json?
        f.sir_trevor_text_area :body
      else 
        f.input :body
      end
    end
    
    f.input :user_id, :as => :hidden, :value => current_user.id if f.object.new_record? || f.object.user.nil?
		
    f.buttons
  end
  
  show  do |post|
    panel 'Details' do
      attributes_table_for post do
        row "Author" do 
          post.user.name if post.user
        end
        row "Posted" do
          post.created_at
        end
      end  
    end
    panel 'Post' do
      attributes_table_for post do
        row :title
        row :excerpt
        row :hero_image do
          image_tag(post.hero_image.thumbnail) unless post.hero_image.url.nil?
        end
        row :body do
         if post.body.is_json?
     		   render_sir_trevor(post.body)
     		 else
     		   simple_format(post.body).html_safe
     	   end
     	  end
      end
    end
  end

end
