class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.string :ticker
      t.integer :shares
      t.decimal :price_per_share
      t.decimal :current_price
      t.boolean :sold

      t.timestamps
    end
  end
end
