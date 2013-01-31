class Resource < ActiveRecord::Base

	scope :published, where(:published => true)

  attr_accessible :excerpt, :title, :body, :user_id, :slug,
									:hero_image, :published, :created_at
  
	belongs_to :user

	validates_presence_of :title, :excerpt, :body
	
	mount_uploader :hero_image, ::ArticleImageUploader
	
	paginates_per 10
	
	extend FriendlyId
  friendly_id :title, use: :history

end