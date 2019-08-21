class SetDefaultToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:organizations, :company, false)

  end
end
