class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :need_api_id
      t.text :role
      t.text :goal
      t.text :benefit
      t.text :organisation_ids
      t.text :justifications
      t.text :impact
      t.text :met_when
    end
  end
end
