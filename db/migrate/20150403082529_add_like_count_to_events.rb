class AddLikeCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :like_count, :integer
  end
end
