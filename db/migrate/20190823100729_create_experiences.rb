class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string   :title
      t.string   :company
      t.string   :location
      t.boolean  :current_working_role, default: false
      t.date     :start_date
      t.date     :end_date
      t.integer  :industry_id
      t.string   :description
      t.timestamps
    end
  end
end
