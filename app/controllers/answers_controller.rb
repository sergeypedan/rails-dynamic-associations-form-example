class AnswersController < ApplicationController

  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @answer = Answer.new
    render :edit
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to @answer, notice: 'created'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'updated'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'destroyed'
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end

end
