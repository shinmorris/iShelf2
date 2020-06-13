class Post < ApplicationRecord
  # 画像アップロード機能をつける

  belongs_to :user
  mount_uploader :image, PictureUploader
  # イイネ機能を実装する
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes



  def liked_by?(current_user)
    likes.where(user_id: current_user).exists?
  end
  # Post.joins(:likes)
  # Author.left_outer_joins(:posts).distinct.select('authors.*, COUNT(posts.*) AS posts_count').group('authors.id')
  Post.left_outer_joins(:likes).select('posts.*, COUNT(id.*) AS post_id').group('posts.id')
  # Post.joins(:likes).select('posts.*,likes.id,likes.user_id AS like_user_id')
  #  Post.left_outer_joins(:likes).select('posts.*,likes.id,likes.user_id AS likeuser_id from')
  # SELECT カラム名 AS 別名, ... FROM テーブル名;
end


