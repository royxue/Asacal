class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :link
      t.integer :like_count
      t.boolean :is_public

      t.timestamps null: false
    end
  end
end
