class AddTotalRatingCountToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :total_rating_count, :integer, default: 0.00
  end
end
