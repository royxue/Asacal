class AddImgColumnsToCalendars < ActiveRecord::Migration
  def change
    add_attachment :calendars, :img
  end
end
