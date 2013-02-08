class Event < ActiveRecord::Base

	scope :future, where("date > ?", Time.now)
	scope :features, where(:featured => true)

  attr_accessible :title, :body, :user_id, :date, :url, :created_at, :featured
  
	belongs_to :user

	before_save :assert_featured
	validates_presence_of :title, :body, :date
	
	private
	
		def assert_featured
	    if self.featured?
	      Event.where('id != ?',self.id).each do |event|
	        event.featured = false
	        event.save!
	      end
	    end
	  end
	
end