class BadgesController < ApplicationController

  def index
    @users_badges = current_user.badges
    @badges = Badge.all
  end

end
