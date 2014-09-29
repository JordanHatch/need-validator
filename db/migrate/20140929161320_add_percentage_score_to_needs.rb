class AddPercentageScoreToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :percentage_score, :decimal, default: 0
  end
end
