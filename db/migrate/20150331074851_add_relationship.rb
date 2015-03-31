class AddRelationship < ActiveRecord::Migration
  def change
    # calendar belongs_to official
    add_reference :calendars, :official, index: true

    # event belongs_to calendar
    add_reference :events, :calendar, index: true
  end
end
