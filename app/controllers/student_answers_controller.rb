class StudentAnswersController < ApplicationController
  # GET /student_answers
  # GET /student_answers.xml
  def index
    @student_answers = StudentAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_answers }
    end
  end

  # GET /student_answers/1
  # GET /student_answers/1.xml
  def show
    @student_answer = StudentAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_answer }
    end
  end

  # GET /student_answers/new
  # GET /student_answers/new.xml
  def new
    @question = Question.where(:id => params[:question] )
    @answers = {}
    @quizId = ""
    
    if @question.count > 0
    @answers =  QuestionAnswers.where(:qid => @question.first.id)
    @quizId = @question.first.id
    end
    
    @student_answer = StudentAnswer.new(:id => params[:question])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_answer }
    end
  end

  # GET /student_answers/1/edit
  def edit
    @student_answer = StudentAnswer.find(params[:id])
  end

  # POST /student_answers
  # POST /student_answers.xml
  def create
    @student_answer = StudentAnswer.new(params[:student_answer])

    respond_to do |format|
      if @student_answer.save
        #format.html { redirect_to(@student_answer, :notice => 'Student answer was successfully created.') }
        format.html { redirect_to :controller => 'student', :action => 'index'}
        format.xml  { render :xml => @student_answer, :status => :created, :location => @student_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_answers/1
  # PUT /student_answers/1.xml
  def update
    @student_answer = StudentAnswer.find(params[:id])

    respond_to do |format|
      if @student_answer.update_attributes(params[:student_answer])
        format.html { redirect_to(@student_answer, :notice => 'Student answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_answers/1
  # DELETE /student_answers/1.xml
  def destroy
    @student_answer = StudentAnswer.find(params[:id])
    @student_answer.destroy

    respond_to do |format|
      format.html { redirect_to(student_answers_url) }
      format.xml  { head :ok }
    end
  end
end
