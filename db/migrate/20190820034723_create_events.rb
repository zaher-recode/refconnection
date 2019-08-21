class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :organization_id
      t.string :address
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
