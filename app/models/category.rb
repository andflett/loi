class Category < ActiveRecord::Base

	scope :active, where(:active => true)

  attr_accessible :title, :slug, :description, :active

	has_many :posts
	has_and_belongs_to_many :users
	
	validates_presence_of :title
	
	extend FriendlyId
  friendly_id :title, use: :history

end