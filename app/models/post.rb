class Post < ActiveRecord::Base

	scope :published, where(:published => true)

  attr_accessible :excerpt, :title, :body, :user_id, :slug,
									:hero_image, :type_id, :published, :created_at, :tag_list
  
	belongs_to :user
	belongs_to :type

	acts_as_taggable_on :tags

	validates_presence_of :title, :excerpt, :body
	
	mount_uploader :hero_image, ::ArticleImageUploader
	
	paginates_per 10
	
	extend FriendlyId
  friendly_id :title, use: :history

end