class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.belongs_to :corner
      t.integer :likes, array: true, default: []
      t.timestamps null: false
    end
  end

end
