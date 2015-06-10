class OauthOnly < ActiveRecord::Migration

  def change
    remove_index :users, :username

    remove_column :users, :crypted_password, :string, null: false
    remove_column :users, :salt, :string, null: false
    remove_column :users, :username, :string, null: false

    add_column :users, :profile, :json, default: {}

    create_table :identities do |t|
      t.belongs_to :user
      t.string :provider, null: false
      t.string :uid, null: false
      t.json :raw_data, default: {}
      t.timestamp :created_at, null: false
    end

    add_index :identities, [:provider, :uid], unique: true
  end

end
