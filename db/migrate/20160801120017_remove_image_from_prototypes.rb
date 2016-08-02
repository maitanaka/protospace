class RemoveImageFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :image, :string
  end
end
