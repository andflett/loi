class HomeController < ApplicationController

	def index
	  
		@posts = Post.all
		@resource = Resource.features
		@event = Event.features
			
  end

end
