class AddScoreFieldsToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :positive_rating_count, :integer, default: 0
    add_column :needs, :neutral_rating_count, :integer, default: 0
    add_column :needs, :negative_rating_count, :integer, default: 0
  end
end
