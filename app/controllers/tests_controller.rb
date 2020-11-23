class TestsController < ApplicationController
  before_action :set_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end