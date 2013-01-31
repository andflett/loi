class Post < ActiveRecord::Base

	scope :published, where(:published => true)

  attr_accessible :excerpt, :title, :body, :user_id, :slug,
									:category_id, :hero_image, :type_id, :published, :created_at
  
	belongs_to :user
	belongs_to :category
	belongs_to :type
	has_and_belongs_to_many :tags

	validates_presence_of :title, :excerpt, :body
	
	mount_uploader :hero_image, ::ArticleImageUploader
	
	paginates_per 10
	
	extend FriendlyId
  friendly_id :title, use: :history

end