class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string    :name
      t.integer   :user_id
      t.text      :catchcopy
      t.text      :concept
      t.integer   :like_count, :default => 0
      t.text      :image

      t.timestamps
    end
  end
end
