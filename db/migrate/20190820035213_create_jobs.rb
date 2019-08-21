class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :organization_id
      t.string :title
      t.text  :description
      t.string :position
      t.string :address
      t.integer :salary

      t.timestamps
    end
  end
end
