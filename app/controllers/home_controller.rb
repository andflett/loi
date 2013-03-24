class HomeController < ApplicationController

	def index
	  
		@posts = Post.limit(16)
		@featured = Post.features + Intrapreneur.features + Event.features
			
  end

end
