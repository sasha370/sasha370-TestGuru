class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all
  end

  def destroy
    #TODO
    # GistRestService.new(@gist).delete
  end

  private

  def find_gist
    @gist = Gist.find_by(user_id: current_user, question_id: @question) || nil
  end


  def gist_params
    params.require(:gist).permit[:id]
  end

end
