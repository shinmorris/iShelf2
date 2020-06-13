class CreatePosts < ActiveRecord::Migration[6.0]
  def change

      create_table :posts do |t|
        t.string     :image,        null: false, default: ""
        t.references :user,         null: false, foreign_key: true
        t.string     :title_id,     null: false, default: ""
        t.string     :photo_name,   null: false, default: ""
        t.string     :instagram_id, null: true,  default: ""  
        t.string     :location,     null: false, default: ""  
        t.timestamps
    end
  end
end
