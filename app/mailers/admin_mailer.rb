class AdminMailer < ActionMailer::Base
  
  default from: "LOI Web <noreply@leagueofintrapreneurs.com>",
          to: "andrewsprinz@gmail.com"

  
  def comment_on_toolkit(toolkit,comment)
    mail(:subject => "New Cubicle Warriors Toolkit Comment")
  end

end