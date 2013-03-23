class HomeController < ApplicationController

	def index
	  
		@posts = Post.limit(16)
		@resource = Resource.features
		@event = Event.features
			
  end

end
