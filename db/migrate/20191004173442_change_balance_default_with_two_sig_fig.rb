class ChangeBalanceDefaultWithTwoSigFig < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :email, nil)
    change_column_default(:users, :email, 5000.00)
  end
end
