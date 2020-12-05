class TestsController < ApplicationController

  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
   if @test.questions.any?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to tests_path, alert: t('.no_questions')
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
