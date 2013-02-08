class HomeController < ApplicationController

	def index
	  @posts = Post.all
		@resource = Resource.features.limit(1)
		@event = Event.features.limit(1)
  end

end
