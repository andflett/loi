class ColophonController < ApplicationController
	
	def about
	  @people = Intrapreneur.founders_and_advisors
	end
	
	def join
	end

end