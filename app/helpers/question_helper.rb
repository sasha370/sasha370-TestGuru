module QuestionHelper

  def question_header(question)
    if question.new_record?
      I18n.t('.create_new_question', test: @test.title )
    else
      I18n.t('.edit_question', test: question.test.title )
    end
  end

end
