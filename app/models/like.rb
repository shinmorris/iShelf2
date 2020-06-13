class Like < ApplicationRecord
  belongs_to :user, foreign_key: true ,optional: true
  belongs_to :post, foreign_key: true ,optional: true
  # validates_uniquenessgn_ket_of :post_id, scope: :user_id
  
 


end



