class StudentController < ApplicationController
  def index
    @message = "Student"
    @quizzes = Quiz.all
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @quizzes }
    end
  end
  
  def take_quiz
    @quizzes = Quiz.find(params[:quiz])
    @questions = Question.where(:quizId => @quizzes.id )
    @answers = {}
    
    @questions.each do |question|
      @answers[question.id] = QuestionAnswers.where(:qid => question.id)
    end
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @quizzes }
    end
  end
  
  def view_students
    @students = StudentAnswers.all
    @quizId = params[:quiz]
    
  end
  def view_score
    @quizzes = Quiz.find(params[:quiz])
    @questions = Question.where(:quizId => @quizzes.id )
    @answers = {}
    
    @questions.each do |question|
      if StudentAnswers.where(:qid => question.id, :id => params[:student]).count > 0
        @answers[question.id] = StudentAnswers.where(:qid => question.id, :id => params[:student]).count
        if StudentAnswers.where(:qid => question.id, :id => params[:student]).first.answer == question.answer
          @answers[question.id] = "Correct"
        else
          @answers[question.id] = "Wrong"
        end
      end
    end
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @quizzes }
    end
  end
  
end
