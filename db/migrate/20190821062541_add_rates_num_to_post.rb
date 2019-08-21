class AddRatesNumToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rates_num, :integer, default: 0
  end
end
