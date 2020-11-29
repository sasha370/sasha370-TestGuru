class Admin::BaseController < ApplicationController

  before_action :admin_required!

  def admin_required!
    redirect_to root_path, alert: t('.must_be_an_admin') unless current_user.admin?
  end

end
