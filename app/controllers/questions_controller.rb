# Comment
class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[show edit update destroy]

  respond_to :json, :html, :js

  def index
    respond_with(@questions = Question.all)
  end

  def show
    @answer = @question.answers.new
  end

  def new
    respond_with(@question = Question.new)
  end

  def edit
    # method
  end

  def create
    @question = Question.create(question_params)
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
