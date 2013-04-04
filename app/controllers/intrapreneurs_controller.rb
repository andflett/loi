class IntrapreneursController < ApplicationController

	def index
		@intrapreneurs = Intrapreneur.where(:founder => false, :advisor => false).order("created_at DESC") + Intrapreneur.where(:advisor => true) + Intrapreneur.where(:founder => true)
  end
  
  def show
    @intrapreneur = Intrapreneur.find(params[:id])
  end

end
