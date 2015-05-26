class LinkingEntriesAndCorners < ActiveRecord::Migration

  def change
    add_column :entries, :corner_id, :integer, null: false
    add_index :entries, :corner_id
  end

end
