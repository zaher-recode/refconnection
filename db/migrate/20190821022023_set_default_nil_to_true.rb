class SetDefaultNilToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:organizations, :organizer, false)

  end
end
