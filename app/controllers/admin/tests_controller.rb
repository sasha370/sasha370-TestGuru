class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show start edit update destroy update_inline]

  def index

  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update_inline
    if @test.update(tests_params)
      redirect_to admin_tests_path, notice: t('.update.success')
    else
      render :index
    end
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

  def set_tests
    @tests = Test.all
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
