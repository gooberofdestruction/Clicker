class TeacherController < ApplicationController
  def index
    @message = "Teacher"
    @quizzes = Quiz.all
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @quizzes }
    end
  end
end
