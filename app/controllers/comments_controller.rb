class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    question = Question.find(params[:question_id])
    @comment = question.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: questions_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: chinchin_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
