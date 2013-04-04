class HomeController < ApplicationController

	def index
	  
		@posts = Post.limit(12).order("created_at DESC")
		@featured = Post.features + Intrapreneur.features + Event.features
			
  end

end
