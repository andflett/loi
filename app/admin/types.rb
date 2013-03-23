Type.all.each do |type|
	
	ActiveAdmin.register Post, :as => type.title do

	  menu :parent => "Inspiration"
	  
	  
	end
	
end