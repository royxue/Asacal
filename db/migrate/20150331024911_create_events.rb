class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :place
      t.boolean :is_all_day
      t.datetime :start_time
      t.datetime :end_time
      t.string :link
      t.text :note

      t.timestamps null: false
    end
  end
end
