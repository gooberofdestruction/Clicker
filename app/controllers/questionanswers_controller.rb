class QuestionanswersController < ApplicationController
  def index
    @questionsanswers = Questionanswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end
end
