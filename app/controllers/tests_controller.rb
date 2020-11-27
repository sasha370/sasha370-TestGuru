class TestsController < ApplicationController

  before_action :set_test, only: %i[show start edit create update destroy]

  def index
    @tests = Test.all
  end

  def edit
  end

  def update
    if @test.update(tests_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def show
    @questions = @test.questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def create
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Test was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
