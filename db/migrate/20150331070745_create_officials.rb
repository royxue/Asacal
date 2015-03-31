class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :link
      t.boolean :is_company
      t.integer :like_count

      t.timestamps null: false
    end
  end
end
