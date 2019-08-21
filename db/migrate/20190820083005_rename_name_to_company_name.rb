class RenameNameToCompanyName < ActiveRecord::Migration[6.0]
  def change
    rename_column :organizations, :name, :company_name

  end
end
