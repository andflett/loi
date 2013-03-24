class Resource < ActiveRecord::Base

	scope :features, where(:featured => true)
	
  attr_accessible :title, :body, :user_id, :url, :created_at, :featured, :image
  
	belongs_to :user

	validates_presence_of :title, :body, :url
	
	mount_uploader :image, ::ResourceImageUploader
	
end