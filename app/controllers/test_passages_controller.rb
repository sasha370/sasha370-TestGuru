class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.change_passed_status
      check_badges(@test_passage) if @test_passage.passed
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def check_badges(test_passage)
    BadgeService.new(test_passage).call
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
