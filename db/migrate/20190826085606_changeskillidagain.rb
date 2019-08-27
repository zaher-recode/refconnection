class Changeskillidagain < ActiveRecord::Migration[6.0]
  def change
    rename_column :userskills, :skill_ids, :skill_id

  end
end
