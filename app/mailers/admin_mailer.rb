class AdminMailer < ActionMailer::Base
  
  default from: "LOI Web <noreply@leagueofintrapreneurs.com>",
          to: "andrewsprinz@gmail.com"
  
  def new_user(user)
    @user = user
    mail(:subject => "New League of Intrapreneurs Member")
  end

end