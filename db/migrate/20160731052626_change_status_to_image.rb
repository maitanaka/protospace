class ChangeStatusToImage < ActiveRecord::Migration
  #変更後の型
  def up
    change_column :Images, :status, :integer, default: 0, null: false, limit: 1
  end

  #変更前の型
  def down
    change_column :Images, :status, :integer
  end
end
