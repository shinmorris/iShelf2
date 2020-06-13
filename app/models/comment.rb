class Comment < ApplicationRecord
    belongs_to :user, foreign_key: true ,optional: true
    belongs_to :question, foreign_key: true ,optional: true

    validates :content, presence: true,null: false

end
