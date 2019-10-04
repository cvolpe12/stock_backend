class AddInvestingToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :investing, :decimal
  end
end
