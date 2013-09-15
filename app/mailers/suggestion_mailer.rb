class SuggestionMailer < ActionMailer::Base
  default from: "no-reply@kristen-mills.com"

  def new_suggestion(suggestion)
    @suggestion = suggestion
    mail(to: 'kristen@kristen-mills.com', subject: 'There is a new nickname suggestion!')
  end

end
