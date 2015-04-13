class AddImgColumnsToEvents < ActiveRecord::Migration
  def change
    add_attachment :events, :img
  end
end
