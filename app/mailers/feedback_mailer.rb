class FeedbackMailer < ApplicationMailer

  def feedback(feedback)
    @title = feedback[:title]
    @description = feedback[:description]
    @user = feedback[:user]

    mail to: set_admin,
         subject: "#{@title}"
  end

  private

  def set_admin
    @admin = Admin.first
  end
end
