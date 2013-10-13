class ToolkitsController < ApplicationController

	def show
	  @toolkit = Toolkit.find(params[:id])
  end

	def index
		@toolkits = Toolkit.order("priority ASC").all
	end

end
