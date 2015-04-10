class AddVerifiedToOfficial < ActiveRecord::Migration
  def change
    add_column :officials, :verified, :boolean
  end
end
