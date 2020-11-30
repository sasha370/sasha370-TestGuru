class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all
  end

  def destroy
    gist = Gist.find(params[:id])
    gist.destroy
    begin
      GistRestService.new(gist).delete
      redirect_to admin_gists_path, notice: t('.success')
    rescue
      flash[:alert] = t('gists.server_error')
    end
  end

end
