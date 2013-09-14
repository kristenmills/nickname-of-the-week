class HomeController < ApplicationController
  def index
    @nickname = Week.all.keep_if{ |x| x.this_week?}[0].nickname
    @suggestion = Suggestion.new
  end
end
