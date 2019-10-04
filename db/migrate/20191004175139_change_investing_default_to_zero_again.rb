class ChangeInvestingDefaultToZeroAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :investing, :decimal, :default => 0.00, :precision => 15, :scale => 3
    change_column :users, :balance, :decimal, :default => 5000.00, :precision => 15, :scale => 3
  end
end