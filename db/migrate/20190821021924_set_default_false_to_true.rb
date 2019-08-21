class SetDefaultFalseToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:organizations, :company, true)

  end
end
