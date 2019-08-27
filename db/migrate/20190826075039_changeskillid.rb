class Changeskillid < ActiveRecord::Migration[6.0]
  def change
    rename_column :userskills, :skill_id, :skill_ids

  end
end
