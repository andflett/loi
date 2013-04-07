class HomeController < ApplicationController

	def index
	  
		@posts = Post.limit(12).order("created_at DESC")
		@featured = Post.features.order("created_at DESC") + Intrapreneur.features + Resource.features + Event.features
			
  end

end
