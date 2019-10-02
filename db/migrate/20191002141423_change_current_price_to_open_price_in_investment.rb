class ChangeCurrentPriceToOpenPriceInInvestment < ActiveRecord::Migration[6.0]
  def change
    add_column :investments, :open_price, :decimal
  end
end
