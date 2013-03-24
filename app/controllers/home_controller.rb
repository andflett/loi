class HomeController < ApplicationController

	def index
	  
		@posts = Post.limit(16)
		@featured = Intrapreneur.features + Post.features + Event.features
			
  end

end
