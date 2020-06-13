class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string     :ask_category, null: false
      t.text       :ask_title, null: false
      t.text       :ask_content, null: false
      t.string     :ask_image, null: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
