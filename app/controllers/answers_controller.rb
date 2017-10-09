class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  def index
    respond_with(@answers = Answer.all)
  end

  def show
  end

  def new
    respond_with(@answer = Answer.new)
  end

  def edit
  end

  def create
    @answer = Answer.create(answer_params)
    respond_with(@answer)
  end

  def update
    @answer.update(answer_params)
    respond_with(@answer)
  end

  def destroy
    @answer.destroy
    respond_with(@answer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :question_id)
    end
end