class SorceryCore < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username,         null: false
      t.string :email
      t.string :crypted_password, null: false
      t.string :salt,             null: false
      t.timestamp :created_at,    null: false
    end
    add_index :users, :username, unique: true
  end

end
