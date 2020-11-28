class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show start edit update destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
    p @test
  end

  def edit
  end

  def update
        if @test.update(tests_params)
      redirect_to admin_test_path(@test) , notice: 'Тест успешно обновлен!'
    else
      render :edit
    end
  end

  def show
    @questions = @test.questions
  end

  # Todo  Может ли Админ прохордить тесты?
  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def create
    @test = Test.new(tests_params)
    @test.author = current_user
    if @test.save
      redirect_to admin_test_path(@test) , notice: 'Тест успешно создан!'
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: 'Test was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
