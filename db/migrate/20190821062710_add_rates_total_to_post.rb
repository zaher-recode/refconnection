class AddRatesTotalToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rates_total, :integer, default: 0
  end
end
