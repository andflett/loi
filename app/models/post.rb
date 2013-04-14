class Post < ActiveRecord::Base

	scope :published, where(:published => true)
	scope :features, where(:featured => true)

  attr_accessible :excerpt, :title, :body, :user_id, :slug, :featured,
									:hero_image, :type_id, :published, :created_at, :tag_list,
									:url, :download
  
	belongs_to :user
	belongs_to :type

	acts_as_taggable_on :tags

	validates_presence_of :title, :excerpt, :body, :type
	
	mount_uploader :hero_image, ::ArticleImageUploader
	mount_uploader :download, ::PodcastUploader
		
	extend FriendlyId
  friendly_id :title, use: :history

end