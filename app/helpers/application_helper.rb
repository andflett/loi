module ApplicationHelper
  
  def spannerize(content)
    content.to_s.split("").map{|c| "<span>#{c}</span>" }.join.html_safe
  end
  
end
