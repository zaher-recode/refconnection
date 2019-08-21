class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.float :avg_rating
      t.integer :category_id

      t.timestamps
    end
  end
end
