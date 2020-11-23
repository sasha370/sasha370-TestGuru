module QuestionHelper

  def question_header(question)
    if question.new_record?
      "<h2>Создать новый вопрос для теста #{@test.title}</h2>".html_safe
    else
      "<h2>Редактировать вопрос из теста #{question.test.title}</h2>".html_safe
    end
  end

end
