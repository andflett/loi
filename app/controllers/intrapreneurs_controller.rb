class IntrapreneursController < ApplicationController

	def index
		@intrapreneurs = Intrapreneur.all
  end
  
  def show
    @intrapreneur = Intrapreneur.find(params[:id])
  end

end
