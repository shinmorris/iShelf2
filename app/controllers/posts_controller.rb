class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:index,:entry,:award]
  before_action :authenticate_kanri!, only: [:kanrikanri]


  def index
    @users = User.all
    @like  = Like.new
    card = Card.all
    @current_user = current_user.id 
    @card = Card.where(user_id: @current_user)
     
    @posts=Post.where(created_at: ("2020-05-10 00:00:00")..("2020-05-30 00:00:00"))
    # 上で時刻を指定してもってくる
    
    @thema=Post.where(title_id: :title_id)

    @thema1 = @posts.where(title_id:"1")
    @thema2 = @posts.where(title_id:"2")
    @thema3 = @posts.where(title_id:"3")
  end

  def new
    @post = Post.find(params[:id])

  end
 
  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    
    if @post.save
      redirect_to posts_path,notice:'投稿が完了しました。'
    else
      redirect_to posts_path,notice: '入力に誤りがあります。'
    end

    
  end

  def entry
    @post=Post.new
  end
  

  def award
# お題１
    @post1 = Post.find(1)
    @post2 = Post.find(2)
    @post3 = Post.find(3)
# お題2
    @post4 = Post.find(3)
    @post5 = Post.find(3)
    @post6 = Post.find(3)
# お題3
    @post7 = Post.find(3)
    @post8 = Post.find(3)
    @post9 = Post.find(3)

  end

  def kanrikanri
    @zenbu = Post.joins(:likes)
    .select("
      posts.title_id,
      posts.id,
      posts.user_id, 
      Likes.id AS likeid,
      Likes.user_id AS name
      ")
    @thema1 = @zenbu.where(title_id:"1")
    @thema2 = @zenbu.where(title_id:"2")
    @thema3 = @zenbu.where(title_id:"3")
    @count1=@thema1.group(:post_id).count(:post_id)
    @count2=@thema2.group(:post_id).count(:post_id)
    @count3=@thema3.group(:post_id).count(:post_id)
  end

  private 
  def post_params
    params.require(:post).permit(:image,:title_id,:current_user_id,:photo_name,:instagram_id, :location)
  end
end  