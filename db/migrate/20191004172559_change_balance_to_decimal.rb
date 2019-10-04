class ChangeBalanceToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :balance, :decimal
  end
end
