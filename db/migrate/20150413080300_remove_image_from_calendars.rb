class RemoveImageFromCalendars < ActiveRecord::Migration
  def change
    remove_column :calendars, :image
  end
end
