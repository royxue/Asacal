class CreateUsersOfficials < ActiveRecord::Migration
  def change
    create_table :users_officials do |t|
      t.integer :user_id, null: false
      t.integer :official_id, null: false
    end
  end
end
