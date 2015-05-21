class LikesUpdate < ActiveRecord::Migration

  def up
    remove_column :entries, :likes
    add_column :entries, :likes, :integer, array: true, default: []
  end

  def down
    remove_column :entries, :likes
    add_column :entries, :likes, :string, array: true, default: []
  end

end
