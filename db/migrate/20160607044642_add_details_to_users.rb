class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile, :string
    add_column :users, :work, :string
    add_column :users, :group, :string
  end
end
