class HomeController < ApplicationController

	def index
	  
		@posts = Post.limit(16)
		@featured = Event.features + Post.features + Intrapreneur.features
			
  end

end
