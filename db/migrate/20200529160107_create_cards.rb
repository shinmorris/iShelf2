class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      # t.references :user, foreign_key: true, null: false
      # t.string :customer_id, null: false
      # t.string :card_id, null: false

      t.string :customer_token, null: false
      t.references :user, forign_key: true
      t.timestamps
    end
  end
end
