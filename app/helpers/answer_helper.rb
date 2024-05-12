module AnswerHelper
  def answer_icon(answer)
    case answer.status
    when "pending" then "fa-hourglass"
    when "accepted" then "fa-check"
    else "fa-times" # "rejected"
    end
  end
end
