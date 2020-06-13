class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :name, :string,  default: ""
    add_column :users, :image, :binary
    add_column :users, :insta_id, :string, default: "", unique: true


  end
end
