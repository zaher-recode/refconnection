class AddUserIdToExperience < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :user_id, :integer
  end
end
