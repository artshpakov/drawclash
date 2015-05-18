class CreateCorners < ActiveRecord::Migration

  def change
    create_table :corners do |t|
      t.string :name, null: false
      t.string :logo_uid
      t.string :slug, null: false
      t.text :description
      t.timestamp :created_at, null: false
    end
    add_index :corners, :slug, unique: true

    create_table :corners_users, id: false do |t|
      t.integer :corner_id
      t.integer :user_id
    end
  end

end
