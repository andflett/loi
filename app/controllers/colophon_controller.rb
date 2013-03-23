class ColophonController < ApplicationController
	
	def about
	end
	
	def people
	  @people = Post.all
	end
	
	def join
	end

end