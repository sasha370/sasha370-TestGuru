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
      I18n.t('.create_new_answer', question: @question.body)
    else
      I18n.t('.edit_answer', question: answer.question.body)
    end
  end
end
