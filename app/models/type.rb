class Type < ActiveRecord::Base

  attr_accessible :title, :slug

	has_many :posts
	
	validates_presence_of :title
	
	extend FriendlyId
  friendly_id :title, use: :history

end