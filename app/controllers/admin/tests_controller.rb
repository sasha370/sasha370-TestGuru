class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show start edit update destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update
    if @test.update(tests_params)
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :edit
    end
  end

  def show
    @questions = @test.questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def create
    @test = current_user.created_tests.new(tests_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
