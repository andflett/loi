class ColophonController < ApplicationController
	
	def about
	  @people = Intrapreneur.where(:founder => true) + Intrapreneur.where(:advisor => true)
	end
	
	def join
	end

end