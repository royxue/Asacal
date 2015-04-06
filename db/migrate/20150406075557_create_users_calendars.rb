class CreateUsersCalendars < ActiveRecord::Migration
  def change
    create_table :users_calendars do |t|
      t.integer :user_id, null: false
      t.integer :calendar_id, null: false
    end
  end
end
