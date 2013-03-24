class Event < ActiveRecord::Base

	scope :future, where("date > ?", Time.now)
	scope :features, where(:featured => true)

  attr_accessible :title, :body, :user_id, :date, :url, :created_at, :featured, :image, :excerpt
  
	belongs_to :user

	validates_presence_of :title, :body, :date
	
	mount_uploader :image, ::ResourceImageUploader
	
end