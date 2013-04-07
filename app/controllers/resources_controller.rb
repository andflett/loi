class ResourcesController < ApplicationController

	def index
	  @resources = Resource.order("created_at DESC")
  end

end
