module AnswersHelper

  def answer_correct_label(answer_correct)
    if answer_correct
      "<i class='fa fa-check-circle fa-lg' style='color:green'></i>".html_safe
    else
      "<i class='fa fa-times-circle fa-lg' style='color:red'></i>".html_safe
    end
  end

  def answer_header(answer)
    if answer.new_record?
      "<h2>Создать новый ответ для вопроса #{@question.body}</h2>".html_safe
    else
      "<h2>Редактировать ответ для вопроса #{answer.question.body}</h2>".html_safe
    end
  end
end
