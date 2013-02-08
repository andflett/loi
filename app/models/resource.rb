class Resource < ActiveRecord::Base

	scope :features, where(:featured => true)
	
  attr_accessible :title, :body, :user_id, :url, :created_at, :featured
  
	belongs_to :user

  before_save :assert_featured
	validates_presence_of :title, :body, :url

	private
	
		def assert_featured
	    if self.featured?
	      Resource.where('id != ?',self.id).each do |resource|
	        resource.featured = false
	        resource.save!
	      end
	    end
	  end

end