class FollowingCorners < ActiveRecord::Migration

  def change
    create_table :followings, id: false do |t|
      t.belongs_to :user
      t.integer :entity_id, null: false
      t.string :entity_type, null: false
    end
  end

end
