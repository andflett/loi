ActiveAdmin.register Post do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :parent => "Inspiration", :priority => 1, :if => proc{ can?(:manage, Post) }
    
  filter :title
  
	index do
    column("Title") { |post| link_to post.title, admin_post_path(post) }
    column("Author") { |post| post.user.name unless post.user.nil? }
    column("State") { |post| status_tag((post.published) ? "Published" : "Unpublished") }
    column "" do |post|
      "#{link_to "Edit", edit_admin_post_path(post)} &nbsp; #{link_to "Delete", admin_post_path(post), :method => "delete", :confirm => "Are you sure you wish to delete this post?"}".html_safe
    end
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		
		f.inputs "Tags" do
			f.autocomplete_field :tag_list, autocomplete_tag_name_posts_path, :"data-delimiter" => ', '
		end
		
		f.inputs "Type of post" do
				f.input :type
				f.input :featured, :label => "Featured on homepage?"
		end
		
		if f.object.new_record? || f.object.user.nil?
    	f.input :user_id, :as => :hidden, :value => current_user.id
		end
		
		unless f.object.new_record?
			f.inputs "Dates" do
			  f.input :published, :label => "Publish this post now?"
				f.input :created_at, :label => "Published at" 
			end
		end
		
    f.inputs "Post" do   
      f.input :hero_image, :label => "Thumbnail"
      f.input :title
      f.input :excerpt, :input_html => { :rows => 5 }
    end

    f.inputs "Body" do
      if post.new_record? || post.body.is_json?
        f.sir_trevor_text_area :body
      else 
        f.input :body
      end
    end
		
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
