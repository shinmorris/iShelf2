class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :likes , dependent: :destroy 
  has_many :posts, through: :likes, source: :post
  has_many :question
  has_many :cards
  # has_one :card

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      user.save(:validate => false)
    end
    user
  end

  User.joins(:posts,:likes)
    

end
