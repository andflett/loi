class AdminMailer < ActionMailer::Base
  
  default from: "LOI Web <noreply@leagueofintrapreneurs.com>",
          to: (Rails.env.production?) ? Chapter.find_by_title('London').users.crew.map(&:email) : "andrewsprinz@gmail.com"
  
  def new_user(user)
    @user = user
    mail(:subject => "New League of Intrapreneurs Member")
  end

end
