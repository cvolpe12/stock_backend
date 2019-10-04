class ChangeBalanceDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :balance, 5000.00
  end
end
