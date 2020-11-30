class GistsController < ApplicationController
  before_action :set_test_passage, :set_question
  before_action :find_gist, only: %i[create make_gist_record]

  def create
    if @gist
      if gist_exist_in_github?
        flash[:alert] = t('gists.create.gist_already_exist')
      else
        @gist.destroy
        make_gist_record
      end
    else
      make_gist_record
    end
    redirect_to @test_passage
  end

  def make_gist_record
    resource = create_gist_on_github(@question)
    if resource
      create_gist_in_db(resource)
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.failure')
    end
  end

  def show
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

  def create_gist_in_db(resource)
    record = Gist.new(user_id: current_user.id, question_id: @question.id, url: resource.html_url, remote_id: resource.id)
    unless record.save
      flash[:alert] = t('.failure')
    end
  end

  def create_gist_on_github(question)
    GistQuestionService.new(question).call
  end

  def gist_exist_in_github?
    GistRestService.new(@gist).check
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def set_question
    @question = @test_passage.current_question
  end

  def gist_params
    params.require(:gist).permit[:id]
  end

end
