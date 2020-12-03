class FeedbackMailer < ApplicationMailer
  before_action :set_admin

  def feedback(feedback)
    @title = feedback[:title]
    @description = feedback[:description]
    @user = feedback[:user]

    mail to: @admin,
         subject: "#{@title}"
  end

  private

  def set_admin
    @admin = Admin.first
  end
end
