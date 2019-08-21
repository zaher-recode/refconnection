class AddCompanyNameToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :contact_person_name, :string
  end
end
