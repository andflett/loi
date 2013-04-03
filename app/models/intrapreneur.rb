class Intrapreneur < ActiveRecord::Base

	scope :features, where(:featured => true)
  
  attr_accessible :name, :link, :job_title, :quote, :body,
									:hero_image, :user_id, :slug, :featured,
									:founder, :advisor
  
	belongs_to :user

	validates_presence_of :name, :body
	
	mount_uploader :hero_image, ::AvatarUploader
	
	paginates_per 20
	
	extend FriendlyId
  friendly_id :name, use: :history

end