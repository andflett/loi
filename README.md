### Mailchimp/Devise integration

User accounts are tied to a Mailchimp subscriber lists. Users can edit their preferences on their profile page. 

Set your API key and list name in `config/mailchimp.yml`

### Uploader storage

By default the application uses carrierwave and S3 for storage. You'll need to pop your AWS credential in `config/carrierwave.yml`


### Making something Commentable

Thar includes an ActiveRecord extension to make things commentable upon:

Show the comments form

    <%= 
	    render :partial => "comments/panel", :locals => { 
		    :comments => @modelName.comments, 
		    :commentable => @modelName
	    } 
    %>

Extend your model

    acts_as_commentable

	# Change the labels
	acts_as_commentable :label => "Ideas", :title => "Tell us yer ideas!"
	
Labels can be instance specific, try this in your controller

    model.commentable_title = "Tell us yer ideas!"
	model.commentable_label = "Ideas"

Add some routeage

    resources :model do
	  resources :comments 
	end