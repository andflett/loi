class Toolkit < ActiveRecord::Base
  
  attr_accessible :description, :title, :subtitle, :slug, :created_at, :download, :priority
  
	validates_presence_of :title, :description, :subtitle, :priority
	
	mount_uploader :download, ::PodcastUploader
		
	extend FriendlyId
  friendly_id :title, use: :history

  acts_as_commentable

end