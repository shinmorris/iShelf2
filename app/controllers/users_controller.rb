class UsersController < ApplicationController
  # プロフィールページ
  def index
    @user = current_user
    @users = User.find(current_user.id)
    @post = Post.where(user_id: current_user.id)

  end

  # 編集ページ
  def show
    @questions=Question.where(user_id:current_user.id)

  end

  def edit

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to edit_user_registration_path
    end
  end

  def kanri
    @s=User.all

  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:name, :age,:insta_id)
  end

end

