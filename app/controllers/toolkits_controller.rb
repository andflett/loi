class ToolkitsController < ApplicationController

	def show
	  @toolkit = Toolkit.find(params[:id])
  end

	def index
		@toolkits = Toolkit.order("priority ASC").all
	end
	
	def share
	  respond_to do |format|
      format.js if request.xhr?
    end
	end
	
	def comment
	  respond_to do |format|
      format.js if request.xhr?
    end
	  # commentable...
	end

end
