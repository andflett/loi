class CategoriesController < ApplicationController

	def show
		
	  @category = Category.find(params[:id])
	
		# FriendlyID History
    if request.path != category_path(@category)
      return redirect_to category_path(@category), :status => :moved_permanently
    end
	
  end

end
