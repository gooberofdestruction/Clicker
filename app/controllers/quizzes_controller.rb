class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.xml
  def index
    @quizzes = Quiz.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.xml
  def show
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.xml
  def new
    @quiz = Quiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.xml
  def create
    @quiz = Quiz.new(params[:quiz])

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to(@quiz, :notice => 'Quiz was successfully created.') }
        format.xml  { render :xml => @quiz, :status => :created, :location => @quiz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.xml
  def update
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        format.html { redirect_to(@quiz, :notice => 'Quiz was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.xml
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to(quizzes_url) }
      format.xml  { head :ok }
    end
  end
  
  def view_quiz
    @quizzes = Quiz.find(params[:id])
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
  def view_scores
    @quizzes = Quiz.find(params[:id])
    @questions = Question.where(:quizId => @quizzes.id )
    @correct = {}
    @wrong = {}
    @total = {}
    
    @questions.each do |question|
      
      @correct[question.id] = 0
      @wrong[question.id] = 0
      @total[question.id] = StudentAnswers.where(:qid => question.id).count
      
      if StudentAnswers.where(:qid => question.id).count > 0
        StudentAnswers.where(:qid => question.id).each do |student|
          
          if student.answer == question.answer
            @correct[question.id] = @correct[question.id]+1
          else
            @wrong[question.id] = @wrong[question.id]+1
          end
        end
      end
    end
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @quizzes }
    end
  end
end
