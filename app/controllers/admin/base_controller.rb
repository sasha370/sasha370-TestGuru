class Admin::BaseController < ApplicationController

  before_action :admin_required!

  def admin_required!
    redirect_to root_path, alert: 'You must be an admin to see that!!!' unless current_user.admin?
  end

end
