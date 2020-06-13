class Question < ApplicationRecord
    belongs_to :user, foreign_key: true ,optional: true
    mount_uploader :ask_image, PictureUploader
    
    has_many :comments

    validates   :ask_category, presence: true
    validates   :ask_title, presence: true
    validates   :ask_content, presence: true
   
    


    scope :with_keywords, -> keywords {
        if keywords.present?
          columns = [:ask_content,:ask_title]
          where(keywords.split(/[[:space:]]/).reject(&:empty?).map {|keyword|
            columns.map { |a| arel_table[a].matches("%#{keyword}%") }.inject(:or)
          }.inject(:and))
        end
      }


end
