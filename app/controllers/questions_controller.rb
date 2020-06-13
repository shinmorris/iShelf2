class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :new]

  def index
    @questions=Question.all
    @question=Question.new

    @q = Question.with_keywords(params.dig(:q, :keywords)).ransack(params[:q])
    @results = @q.result
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments
    @comment = @question.comments.build
  end

  def create
    @question=Question.new(question_params)
    @question.user_id=current_user.id
    
    if @question.save
      redirect_to questions_path,notice:'投稿が完了しました。'
    else
      redirect_to questions_path,notice: '入力に誤りがあります。'
    end
  end

  def new
    @q = Question.with_keywords(params.dig(:q, :keywords)).ransack(params[:q])
    @results = @q.result
  end

  def destroy
  end

  private
  def question_params
    params.require(:question).permit(:ask_category,:ask_title,:ask_content,:ask_image,:user)
  end

end
