class CreateBattles < ActiveRecord::Migration

  def change
    create_table :battles do |t|
      t.string :name, null: false
      t.belongs_to :corner
      t.integer :entries_count, default: 0
      t.timestamp :open_until
      t.timestamps null: false
    end
    add_index :battles, :corner_id

    create_table :entries do |t|
      t.belongs_to :battle
      t.belongs_to :user
      t.string :image_uid, null: false
      t.string :likes, array: true, default: []
      t.timestamp :created_at, null: false
    end
    add_index :entries, :battle_id

    add_column :corners, :battles_count, :integer, default: 0
  end

end
