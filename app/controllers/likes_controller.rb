class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create,:destroy]

  def create
    @post = Post.find(params[:post_id])
    @current_user=current_user.id    
    @like = Like.create!(user_id: @current_user, post_id: params[:post_id])
    
    @like.save
    @posts = Post.find(params[:post_id])  
  end
  
  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    @like_count = Like.where(post_id: params[:post_id]).count
    @posts = Post.find(params[:post_id])  

  end
end  