class AddImgAndRemoveImageForOfficials < ActiveRecord::Migration
  def change
    remove_column :officials, :image
    add_attachment :officials, :img
  end
end
